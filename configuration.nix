{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
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
  	xwayland.enable = true;
  };
  
  services.xserver.xkb = {
    layout = "ch";
    variant = "fr";
  };

  console.keyMap = "fr_CH";

  services.printing.enable = true;

  services.tuned.enable = true;
  services.upower.enable = true;

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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
  
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
   nh
   bibata-cursors
   lm_sensors
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only 
    nerd-fonts.jetbrains-mono
    font-awesome
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  system.stateVersion = "26.05"; 

}
