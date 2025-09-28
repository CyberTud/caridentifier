import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../application/providers/settings_provider.dart';
import '../../application/providers/repository_providers.dart';
import '../widgets/app_navigation_bar.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {

  void _showThemeDialog() {
    final settings = ref.read(settingsProvider);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('System'),
              subtitle: const Text('Follow system theme'),
              value: ThemeMode.system,
              groupValue: settings.themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(settingsProvider.notifier).updateThemeMode(value);
                  Navigator.of(context).pop();
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Light'),
              subtitle: const Text('Always use light theme'),
              value: ThemeMode.light,
              groupValue: settings.themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(settingsProvider.notifier).updateThemeMode(value);
                  Navigator.of(context).pop();
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark'),
              subtitle: const Text('Always use dark theme'),
              value: ThemeMode.dark,
              groupValue: settings.themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(settingsProvider.notifier).updateThemeMode(value);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRegionDialog() {
    final settings = ref.read(settingsProvider);
    final TextEditingController controller = TextEditingController(
      text: settings.regionHint ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Region Hint'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Provide a hint about your region to help improve car identification accuracy.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'e.g., US, EU, Japan, Australia',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final hint = controller.text.trim();
              ref.read(settingsProvider.notifier).updateRegionHint(
                hint.isEmpty ? null : hint,
              );
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

void _clearAllData() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Data'),
        content: const Text(
          'This will permanently delete all your car analyses and cached data. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final repository = ref.read(carAnalysisRepositoryProvider);
              await repository.clearAllAnalyses();
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All data cleared'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'CarPeek',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(
        Icons.directions_car_rounded,
        size: 48,
        color: Theme.of(context).colorScheme.primary,
      ),
      children: [
        const Text(
          'A polished Flutter app for car identification using LLM Vision technology.',
        ),
        const SizedBox(height: 16),
        const Text(
          'Built with Flutter, Riverpod, and Material 3 design.',
        ),
      ],
    );
  }

  Future<void> _openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      debugPrint('Attempting to launch URL: $url');

      // Try external browser first
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('External launch failed, trying in-app browser');
        // Try in-app browser as fallback
        await launchUrl(
          uri,
          mode: LaunchMode.inAppBrowserView,
        );
      }

      debugPrint('Successfully launched URL: $url');
    } catch (e) {
      debugPrint('ERROR: Could not launch URL: $url - Error: $e');
      // Show error to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open link. Please visit: $url'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  String _getThemeModeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        title: Text(
          'Settings',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance Section
          SettingsSection(
            title: 'Appearance',
            children: [
              SettingsTile(
                title: 'Theme',
                subtitle: _getThemeModeText(settings.themeMode),
                leadingIcon: Icons.palette_rounded,
                onTap: _showThemeDialog,
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Analysis Section
          SettingsSection(
            title: 'Analysis',
            children: [
              SettingsTile(
                title: 'Region Hint',
                subtitle: settings.regionHint ?? 'Not set',
                leadingIcon: Icons.location_on_rounded,
                onTap: _showRegionDialog,
              ),
              SettingsTile(
                title: 'Mock Mode',
                subtitle: 'Use sample data instead of real API',
                leadingIcon: Icons.science_rounded,
                trailing: Switch(
                  value: settings.mockMode,
                  onChanged: (value) {
                    ref.read(settingsProvider.notifier).updateMockMode(value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Privacy Section
          SettingsSection(
            title: 'Privacy',
            children: [
              SettingsTile(
                title: 'Clear All Data',
                subtitle: 'Delete all analyses and cached data',
                leadingIcon: Icons.delete_forever_rounded,
                onTap: _clearAllData,
                isDestructive: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Privacy Note
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.privacy_tip_rounded,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Privacy Note',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Your images are processed securely. No data is shared with third parties without your explicit consent.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Legal Section
          SettingsSection(
            title: 'Legal',
            children: [
              SettingsTile(
                title: 'Terms of Use',
                subtitle: 'View our terms and conditions',
                leadingIcon: Icons.description_rounded,
                onTap: () => _openUrl('https://carpeek-termofuse.carrd.co'),
                trailing: const Icon(
                  Icons.open_in_new_rounded,
                  size: 20,
                ),
              ),
              SettingsTile(
                title: 'Privacy Policy',
                subtitle: 'Learn how we protect your data',
                leadingIcon: Icons.lock_rounded,
                onTap: () => _openUrl('https://carpeek-policy.carrd.co'),
                trailing: const Icon(
                  Icons.open_in_new_rounded,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // About Section
          SettingsSection(
            title: 'About',
            children: [
              SettingsTile(
                title: 'About CarPeek',
                subtitle: 'Version 1.0.0',
                leadingIcon: Icons.info_rounded,
                onTap: _showAboutDialog,
              ),
            ],
          ),
          const SizedBox(height: 100), // Bottom padding for navigation bar
        ],
      ),
      bottomNavigationBar: const AppNavigationBar(currentIndex: 2),
    );
  }
}