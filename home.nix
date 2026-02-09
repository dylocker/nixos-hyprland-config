{ config, pkgs, ... }:

{
  home.username = "daniellee";
  home.homeDirectory = "/home/daniellee";
  home.stateVersion = "25.11"; 

  imports = [
    ./hyprland.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      nos = "sudo nixos-rebuild switch --flake .#nixos";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec Hyprland
      fi
    '';
  }; 

  programs.git = {
  	enable = true;
  	userName = "dylocker";
  	userEmail = "dylocker@gmail.com";
  	extraConfig = {
      init.defaultBranch = "main";
  	};
  };
  
  home.packages = with pkgs; [
    brave
    lf
    vscodium
    micro
    foot
    waybar
    kitty
    fastfetch
  ];

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.7"; # 0.0 to 1.0
    };
  };

  programs.home-manager.enable = true;
}
