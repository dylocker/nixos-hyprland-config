{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #services.getty.autologinUser = "daniellee";
  
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.hyprland = {
  	enable = true;
  	withUWSM = false;
  	xwayland.enable = true;
  };
  
  services.xserver.xkb = {
    layout = "ch";
    variant = "fr";
  };

  console.keyMap = "fr_CH";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  boot.extraModprobeConfig = ''
      options snd-hda-intel model=hp-led-hp-mic
    '';

    hardware.enableAllFirmware = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.daniellee = {
    isNormalUser = true;
    description = "Daniel Lee";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   vim
   dmidecode 
   wget
   wl-clipboard
   brightnessctl
   wireplumber
   playerctl
   git
   acpi
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  system.stateVersion = "25.11"; 

}
