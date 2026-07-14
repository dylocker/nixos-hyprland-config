{ pkgs }:

let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0"; # Verify this version still exists if error persists
    platformToolsVersion = "37.0.0"; # UPDATED: Use the latest available version from the error
    buildToolsVersions = [ "34.0.0" "35.0.0" ]; # Consider updating these too if you encounter similar errors
    platformVersions = [ "33" "34" "35" ]; # Added 35 just in case
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
    includeNDK = false;
    #ndkVersions = [ "27.0.12077973" ];
  };

  androidSdk = androidComposition.androidsdk;

in pkgs.mkShell {
  buildInputs = with pkgs; [
    godot_4
    openjdk17
    androidSdk
    android-tools
    glibc
    zlib
    ncurses
    git
  ];
  shellHook = ''
    export ANDROID_HOME="${androidSdk}/libexec/android-sdk"
    export ANDROID_SDK_ROOT="${androidSdk}/libexec/android-sdk"
    export JAVA_HOME="${pkgs.openjdk17.home}"
    export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
    echo "🤖 Godot 4 Android Export Environment Active"
    echo "JDK Path:     $JAVA_HOME"
    echo "Android SDK:  $ANDROID_HOME"
  '';
}
