#!/bin/bash

# Install Android SDK
mkdir -p "$HOME/android-sdk"
curl -o android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
unzip android-sdk.zip -d "$HOME/android-sdk"
rm android-sdk.zip
mkdir -p "$HOME/android-sdk/cmdline-tools"
mv "$HOME/android-sdk/cmdline-tools"/* "$HOME/android-sdk/cmdline-tools/tools"
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Accept licenses
yes | sdkmanager --licenses

# Install necessary SDK components
sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

# Verify installation
adb --version
