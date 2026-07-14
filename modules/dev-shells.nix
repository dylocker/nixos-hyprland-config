# modules/dev-shells.nix
{ pkgs }:

let
  # 1. Define the exact Android SDK components Godot needs
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "8.0";
    platformToolsVersion = "34.0.4";
    buildToolsVersions = [ "33.0.2" "34.0.0" ];
    platformVersions = [ "33" "34" ];
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
    includeNDK = false;
  };

  androidSdk = androidComposition.androidsdk;

in
# OPTION A: Use mkShell (Recommended, lighter)
pkgs.mkShell {
  # Pass the config flags here if needed for specific packages, 
  # though usually handled in flake.nix import.
  
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

# OPTION B: Use buildFHSEnv (Only if Option A fails with path errors)
# pkgs.buildFHSEnv {
#   name = "godot-android-env";
#   targetPkgs = pkgs: with pkgs; [ godot_4 openjdk17 androidSdk android-tools glibc zlib ncurses git ];
#   profile = ''
#     export ANDROID_HOME="${androidSdk}/libexec/android-sdk"
#     export ANDROID_SDK_ROOT="${androidSdk}/libexec/android-sdk"
#     export JAVA_HOME="${pkgs.openjdk17.home}"
#     export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
#     echo "🤖 Godot 4 Android Export Environment Active (FHS)"
#   '';
# }   
