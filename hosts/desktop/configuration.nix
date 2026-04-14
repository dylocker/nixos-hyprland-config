{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix 
    ../../modules/nixos/common.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/home-manager.nix
  ];

  networking.hostName = "nixos-desktop";

  # Desktop Specifics
  hardware.graphics.enable = true;
  
  # If you have an NVIDIA GPU, add this:
  services.xserver.videoDrivers = [ "nvidia" ];

  system.stateVersion = "26.05"; 
}
