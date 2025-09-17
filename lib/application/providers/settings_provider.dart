import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class AppSettings {
  final ThemeMode themeMode;
  final String? regionHint;
  final String backendUrl;
  final bool mockMode;

  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.regionHint,
    this.backendUrl = 'http://192.168.0.164:3000',
    this.mockMode = false,
  });

  AppSettings copyWith({
    ThemeMode? themeMode,
    String? regionHint,
    String? backendUrl,
    bool? mockMode,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      regionHint: regionHint ?? this.regionHint,
      backendUrl: backendUrl ?? this.backendUrl,
      mockMode: mockMode ?? this.mockMode,
    );
  }
}

class SettingsNotifier extends StateNotifier<AppSettings> {
  final Box _settingsBox;

  SettingsNotifier(this._settingsBox) : super(const AppSettings()) {
    _loadSettings();
  }

  void _loadSettings() {
    final themeModeIndex = _settingsBox.get('themeMode', defaultValue: 0) as int;
    final regionHint = _settingsBox.get('regionHint') as String?;
    final backendUrl = _settingsBox.get('backendUrl', defaultValue: 'http://192.168.0.164:3000') as String;
    final mockMode = _settingsBox.get('mockMode', defaultValue: false) as bool;

    state = AppSettings(
      themeMode: ThemeMode.values[themeModeIndex],
      regionHint: regionHint,
      backendUrl: backendUrl,
      mockMode: mockMode,
    );
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _settingsBox.put('themeMode', themeMode.index);
    state = state.copyWith(themeMode: themeMode);
  }

  Future<void> updateRegionHint(String? regionHint) async {
    await _settingsBox.put('regionHint', regionHint);
    state = state.copyWith(regionHint: regionHint);
  }

  Future<void> updateBackendUrl(String backendUrl) async {
    await _settingsBox.put('backendUrl', backendUrl);
    state = state.copyWith(backendUrl: backendUrl);
  }

  Future<void> updateMockMode(bool mockMode) async {
    await _settingsBox.put('mockMode', mockMode);
    state = state.copyWith(mockMode: mockMode);
  }
}

final settingsBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError('Settings box not initialized');
});

final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  final box = ref.watch(settingsBoxProvider);
  return SettingsNotifier(box);
});