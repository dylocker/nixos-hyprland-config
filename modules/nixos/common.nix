{ pkgs, ... }: {

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

  programs.zsh.enable = true;

  # Users
  users.users.daniellee = {
    isNormalUser = true;
    description = "Daniel Lee";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  # System-wide Programs
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  programs.niri = {
    enable = true;
  };

  programs.firefox.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "daniellee";
  };
  services.displayManager.defaultSession = "niri";

  # Ensure hyprlock can verify passwords
  security.pam.services.hyprlock = {};

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";           # Forces Chromium/Electron to use Wayland
  };
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
    nerd-fonts.fira-code
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-chinese-addons # Gives you Pinyin/Bopomofo
      fcitx5-gtk            # For GTK apps
    ];
  };

  # Nix Settings
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size = 134217728; # 128MB
  };
}
