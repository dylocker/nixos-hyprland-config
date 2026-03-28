{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix 
    ../../modules/nixos/common.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/home-manager.nix
  ];

  networking.hostName = "nixos";

  # Laptop-Specific Hardware Fixes
  boot.extraModprobeConfig = "options snd-hda-intel model=hp-led-hp-mic";

  services.xserver.xkb = {
    layout = "ch";
    variant = "fr";
  };
  console.keyMap = "fr_CH";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };
  
  services.getty.autologinUser = "daniellee";

  # Specific User Overrides (Brave with Wayland flags)
  users.users.daniellee.packages = with pkgs; [ 
    (brave.override {
      commandLineArgs = [
        "--password-store=gnome-libsecret"
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        #"--enable-wayland-ime"
        #"--disable-features=WebRtcAllowInputVolumeAdjustment"
      ];
    })
  ];

  # Firewall (Laptop might need different ports than a Desktop/Server)
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 53317 ]; 
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 53315; to = 53318; }
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";      # Specific to Intel (be careful here)
  };

  # Power Management
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  system.stateVersion = "26.05"; 
}
