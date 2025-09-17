import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/car_analysis.dart';
import '../widgets/confidence_chip.dart';
import '../widgets/specs_card.dart';
import '../widgets/price_estimates_card.dart';
import '../widgets/history_timeline.dart';
import '../widgets/maintenance_tips_card.dart';
import '../widgets/similar_models_section.dart';

class ResultsScreen extends ConsumerStatefulWidget {
  final CarAnalysis analysis;

  const ResultsScreen({
    super.key,
    required this.analysis,
  });

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _staggerController;
  late List<Animation<double>> _staggeredAnimations;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _staggerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Create staggered animations for each section
    _staggeredAnimations = List.generate(6, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _staggerController,
          curve: Interval(
            index * 0.1,
            (index * 0.1) + 0.4,
            curve: Curves.easeOutBack,
          ),
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mainController.forward();
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          _staggerController.forward();
        }
      });
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _staggerController.dispose();
    super.dispose();
  }

  void _shareResults() {
    HapticFeedback.lightImpact();
    // Implement share functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share functionality coming soon!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _saveResults() {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Results saved to your collection!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // App bar with hero image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: colorScheme.surface,
            leading: IconButton(
              onPressed: () => context.go('/'),
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withOpacity(0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: _shareResults,
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.share_rounded,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'car-image-${widget.analysis.id}',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.analysis.imageLocalPath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          colorScheme.surface.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main title section
                  AnimatedBuilder(
                    animation: _staggeredAnimations[0],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - _staggeredAnimations[0].value)),
                        child: Opacity(
                          opacity: _staggeredAnimations[0].value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${widget.analysis.make} ${widget.analysis.model}',
                                          style: theme.textTheme.headlineMedium?.copyWith(
                                            color: colorScheme.onSurface,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (widget.analysis.generation != null) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            widget.analysis.generation!,
                                            style: theme.textTheme.titleMedium?.copyWith(
                                              color: colorScheme.onSurface.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                        const SizedBox(height: 8),
                                        Text(
                                          widget.analysis.yearRange,
                                          style: theme.textTheme.titleLarge?.copyWith(
                                            color: colorScheme.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ConfidenceChip(confidence: widget.analysis.confidence),
                                ],
                              ),
                              const SizedBox(height: 16),
                              // Body style and trim chips
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  Chip(
                                    label: Text(widget.analysis.bodyStyle),
                                    backgroundColor: colorScheme.primaryContainer,
                                    labelStyle: TextStyle(
                                      color: colorScheme.onPrimaryContainer,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  ...widget.analysis.trimCandidates.take(3).map(
                                    (trim) => Chip(
                                      label: Text('${trim.name} (${(trim.confidence * 100).toInt()}%)'),
                                      backgroundColor: colorScheme.secondaryContainer,
                                      labelStyle: TextStyle(
                                        color: colorScheme.onSecondaryContainer,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Specs card
                  AnimatedBuilder(
                    animation: _staggeredAnimations[1],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - _staggeredAnimations[1].value)),
                        child: Opacity(
                          opacity: _staggeredAnimations[1].value,
                          child: SpecsCard(keySpecs: widget.analysis.keySpecs),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  // Price estimates
                  AnimatedBuilder(
                    animation: _staggeredAnimations[2],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - _staggeredAnimations[2].value)),
                        child: Opacity(
                          opacity: _staggeredAnimations[2].value,
                          child: PriceEstimatesCard(priceEstimates: widget.analysis.priceEstimates),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  // Notable history
                  if (widget.analysis.notableHistory.isNotEmpty) ...[
                    AnimatedBuilder(
                      animation: _staggeredAnimations[3],
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - _staggeredAnimations[3].value)),
                          child: Opacity(
                            opacity: _staggeredAnimations[3].value,
                            child: HistoryTimeline(history: widget.analysis.notableHistory),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                  // Maintenance tips
                  if (widget.analysis.maintenanceTips.isNotEmpty) ...[
                    AnimatedBuilder(
                      animation: _staggeredAnimations[4],
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - _staggeredAnimations[4].value)),
                          child: Opacity(
                            opacity: _staggeredAnimations[4].value,
                            child: MaintenanceTipsCard(tips: widget.analysis.maintenanceTips),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                  // Similar models
                  if (widget.analysis.similarModels.isNotEmpty) ...[
                    AnimatedBuilder(
                      animation: _staggeredAnimations[4],
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - _staggeredAnimations[4].value)),
                          child: Opacity(
                            opacity: _staggeredAnimations[4].value,
                            child: SimilarModelsSection(models: widget.analysis.similarModels),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                  // Disclaimer
                  AnimatedBuilder(
                    animation: _staggeredAnimations[5],
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - _staggeredAnimations[5].value)),
                        child: Opacity(
                          opacity: _staggeredAnimations[5].value,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceVariant.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: colorScheme.outline.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline_rounded,
                                  color: colorScheme.onSurface.withOpacity(0.6),
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    widget.analysis.disclaimer,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 100), // Bottom padding for FAB
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _mainController,
        builder: (context, child) {
          return Transform.scale(
            scale: _mainController.value,
            child: FloatingActionButton.extended(
              onPressed: _saveResults,
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              icon: const Icon(Icons.bookmark_add_rounded),
              label: const Text(
                'Save to Collection',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}