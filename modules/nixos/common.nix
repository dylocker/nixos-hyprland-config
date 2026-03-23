{ inputs, pkgs, ... }: {

  # Bootloader (Standard for most modern UEFI systems)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  
  # Localization
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";

  # Audio (Pipewire is the modern standard)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Essential Services
  services.dbus.enable = true;
  services.printing.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true; # Fixes KWallet/Keyring spam
  services.fstrim.enable = true;               # SSD Health

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  # Users
  users.users.daniellee = {
    isNormalUser = true;
    description = "Daniel Lee";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  # Nix Helper (nh) - The modern way to manage Nix
  #programs.nh = {
  # enable = true;
  # clean.enable = true;
  # clean.extraArgs = "--keep-since 4d --keep 3";
  # flake = "/home/daniellee/.dotfiles";
  #};

  # System-wide Programs
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.firefox.enable = true;
  
  # Ensure hyprlock can verify passwords
  security.pam.services.hyprlock = {};

  # Core Packages & Fonts
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git 
    wget 
    wl-clipboard 
    brightnessctl 
    wireplumber 
    playerctl 
    nh 
    libnotify
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  # Nix Settings
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size = 134217728; # 128MB
  };
}
