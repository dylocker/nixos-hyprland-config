{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix 
    ../../modules/nixos/common.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/home-manager.nix
  ];

  networking.hostName = "nixos_desktop";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true; # Change to false ONLY if you have an old card (Pre-GTX 1600)
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
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

  system.stateVersion = "26.05"; 
}
