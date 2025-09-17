import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import '../../application/providers/repository_providers.dart';
import '../../infrastructure/services/vision_api.dart';
import '../widgets/loading_dots.dart';

class AnalysisScreen extends ConsumerStatefulWidget {
  final String imagePath;
  final String? hint;

  const AnalysisScreen({
    super.key,
    required this.imagePath,
    this.hint,
  });

  @override
  ConsumerState<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _contentController;
  late Animation<double> _imageAnimation;
  late Animation<double> _contentAnimation;
  bool _analysisStarted = false;

  @override
  void initState() {
    super.initState();
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _contentController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _imageAnimation = CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOutBack,
    );
    _contentAnimation = CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeOut,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnalysis();
    });
  }

  @override
  void dispose() {
    _imageController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _startAnalysis() async {
    setState(() {
      _analysisStarted = true;
    });

    _imageController.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _contentController.forward();

    try {
      final repository = ref.read(carAnalysisRepositoryProvider);
      final xFile = XFile(widget.imagePath);

      final analysis = await repository.analyzeImage(
        image: xFile,
        hint: widget.hint,
      );

      if (mounted) {
        context.go('/results', extra: analysis);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(e);
      }
    }
  }

  void _showErrorDialog(dynamic error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Analysis Failed'),
        content: Text(
          error is VisionApiException
              ? error.message
              : 'An unexpected error occurred. Please try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/');
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.surface,
              colorScheme.secondary.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.go('/'),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Analyzing Image',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Image preview with hero animation
              AnimatedBuilder(
                animation: _imageAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _imageAnimation.value,
                    child: Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.file(
                          File(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 48),
              // Loading content
              AnimatedBuilder(
                animation: _contentAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _contentAnimation.value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - _contentAnimation.value)),
                      child: Column(
                        children: [
                          // Loading animation
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: LoadingDots(),
                            ),
                          ),
                          const SizedBox(height: 32),
                          // Status text
                          Text(
                            'Analyzing your car...',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Our AI is identifying the make, model,\nspecs, and more details',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurface.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (widget.hint?.isNotEmpty == true) ...[
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceVariant.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.lightbulb_outline_rounded,
                                    size: 16,
                                    color: colorScheme.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Hint: ${widget.hint}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}