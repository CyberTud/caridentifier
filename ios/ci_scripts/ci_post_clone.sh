#!/bin/sh

# ci_post_clone.sh
# This script is executed by Xcode Cloud after cloning the repository

echo "🔧 Starting post-clone setup..."

# Navigate to iOS directory
cd ios

# Install CocoaPods if not present
if ! command -v pod &> /dev/null; then
    echo "📦 Installing CocoaPods..."
    sudo gem install cocoapods
fi

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf ~/Library/Developer/Xcode/DerivedData/*
rm -rf Pods
rm -f Podfile.lock

# Install Flutter
echo "📱 Setting up Flutter..."
git clone https://github.com/flutter/flutter.git ~/flutter
export PATH="$PATH:~/flutter/bin"

# Get Flutter dependencies
echo "📚 Getting Flutter dependencies..."
cd ..
flutter pub get

# Generate iOS configs
echo "⚙️ Generating iOS configurations..."
flutter build ios --config-only --no-codesign

# Install iOS dependencies
echo "🔗 Installing CocoaPods dependencies..."
cd ios
pod install --repo-update

echo "✅ Post-clone setup complete!"