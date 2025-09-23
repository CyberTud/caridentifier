import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/camera_view.dart';
import '../widgets/app_navigation_bar.dart';
import '../widgets/paywall_screen.dart';
import '../../infrastructure/services/subscription_service.dart';

class CaptureScreen extends ConsumerStatefulWidget {
  const CaptureScreen({super.key});

  @override
  ConsumerState<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends ConsumerState<CaptureScreen>
    with TickerProviderStateMixin {
  final TextEditingController _hintController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final SubscriptionService _subscriptionService = SubscriptionService.instance;
  bool _isGalleryMode = false;
  late AnimationController _floatingButtonController;
  late Animation<double> _floatingButtonAnimation;
  bool _hasScannedOnce = false;

  @override
  void initState() {
    super.initState();
    _floatingButtonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _floatingButtonAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _floatingButtonController,
      curve: Curves.easeInOut,
    ));
    _updateScanStatus();
  }

  Future<void> _updateScanStatus() async {
    final totalScans = await _subscriptionService.getTotalScans();

    if (mounted) {
      setState(() {
        _hasScannedOnce = totalScans > 0;
      });
    }
  }

  @override
  void dispose() {
    _hintController.dispose();
    _floatingButtonController.dispose();
    super.dispose();
  }

  Future<void> _handleImageCapture() async {
    HapticFeedback.lightImpact();
    _floatingButtonController.forward().then((_) {
      _floatingButtonController.reverse();
    });

    // Check if user can scan
    final subscriptionService = SubscriptionService.instance;
    final canScan = await subscriptionService.canScan();

    if (!canScan && mounted) {
      // Show paywall
      final result = await Navigator.push<bool>(
        context,
        MaterialPageRoute(
          builder: (context) => const PaywallScreen(),
          fullscreenDialog: true,
        ),
      );

      // If user didn't subscribe, return
      if (result != true) {
        return;
      }
    }

    try {
      XFile? image;

      if (_isGalleryMode) {
        image = await _imagePicker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 1600,
          maxHeight: 1600,
          imageQuality: 80,
        );
      } else {
        image = await _imagePicker.pickImage(
          source: ImageSource.camera,
          maxWidth: 1600,
          maxHeight: 1600,
          imageQuality: 80,
        );
      }

      if (image != null && mounted) {
        // Record the scan
        await subscriptionService.recordScan();

        final hint = _hintController.text.trim();
        context.push(
          '/analysis?imagePath=${Uri.encodeComponent(image.path)}${hint.isNotEmpty ? '&hint=${Uri.encodeComponent(hint)}' : ''}',
        );

        // Update scan status after navigation
        _updateScanStatus();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to capture image: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Icon(
          Icons.directions_car_rounded,
          color: colorScheme.primary,
          size: 32,
        ),
        title: Text(
          'Car Identifier',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
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
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                     MediaQuery.of(context).padding.top -
                     kToolbarHeight -
                     kBottomNavigationBarHeight,
              child: Column(
            children: [
              const SizedBox(height: 40),
              // Hero title section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
                child: Column(
                  children: [
                    Text(
                      'Identify Any Car',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Take a photo or select from gallery to discover make, model, specs, and more',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Camera/Gallery toggle
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isGalleryMode = false),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: !_isGalleryMode
                                  ? colorScheme.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_rounded,
                                  color: !_isGalleryMode
                                      ? colorScheme.onPrimary
                                      : colorScheme.onSurface.withOpacity(0.6),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Camera',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: !_isGalleryMode
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurface.withOpacity(0.6),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _isGalleryMode = true),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: _isGalleryMode
                                  ? colorScheme.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_library_rounded,
                                  color: _isGalleryMode
                                      ? colorScheme.onPrimary
                                      : colorScheme.onSurface.withOpacity(0.6),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Gallery',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: _isGalleryMode
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurface.withOpacity(0.6),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Hint input field
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.08),
                child: TextField(
                  controller: _hintController,
                  decoration: InputDecoration(
                    hintText: 'Add a hint (e.g., "EU plate", "SUV")',
                    hintStyle: TextStyle(
                      color: colorScheme.onSurface.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.lightbulb_outline_rounded,
                      color: colorScheme.primary,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Main capture button
              AnimatedBuilder(
                animation: _floatingButtonAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _floatingButtonAnimation.value,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colorScheme.primary,
                            colorScheme.secondary,
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _handleImageCapture,
                          borderRadius: BorderRadius.circular(60),
                          child: Icon(
                            _isGalleryMode
                                ? Icons.photo_library_rounded
                                : Icons.camera_alt_rounded,
                            size: 48,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    ),
  ),
      bottomNavigationBar: const AppNavigationBar(currentIndex: 0),
    );
  }
}