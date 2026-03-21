{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix 
    ./stylix.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Your specific hardware audio fix ---
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=hp-led-hp-mic
  '';

  # Autologin ----
  services.getty.autologinUser = "daniellee";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Zurich";
  i18n.defaultLocale = "en_US.UTF-8";

  # Fixes the VA-API (libva) error in Brave ---
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver # Use 'mesa.drivers' if on AMD
      libvdpau-va-gl
    ];
  };
  
  #services.xserver.videoDrivers = ["nvidia"];

  # Hyprland Setup
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  security.pam.services.hyprlock = {};

  services.xserver.xkb = {
    layout = "ch";
    variant = "fr";
  };
  console.keyMap = "fr_CH";

  # DBus 
  services.dbus.enable = true;

  #Printing & Power Management ---
  services.printing.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  security.polkit.enable = true;

  # Fixes the KWallet error spam ---
  services.gnome.gnome-keyring.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  # Firmware ---
  hardware.enableAllFirmware = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 53317 ]; # 53317 is the default TCP port for LocalSend
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 53315; to = 53318; }
      { from = 8000; to = 8010; }
    ];
  };   


  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "iHD";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  users.users.daniellee = {
    isNormalUser = true;
    description = "Daniel Lee";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [ 
      (brave.override {
        commandLineArgs = [
          "--password-store=gnome-libsecret"
          "--enable-features=UseOzonePlatform"
          "--ozone-platform=wayland"
          "--enable-wayland-ime"
          "--disable-features=WebRtcAllowInputVolumeAdjustment"
        ];
      })
    ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  

  # Full Package List ---
  environment.systemPackages = with pkgs; [
    dmidecode 
    wget 
    wl-clipboard 
    brightnessctl 
    wireplumber
    playerctl 
    git 
    acpi 
    nh 
    bibata-cursors 
    lm_sensors 
    libnotify 
    adwaita-icon-theme
  ];

  # Your Fonts ---
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only 
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  system.stateVersion = "26.05"; 
}
