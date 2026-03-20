{  pkgs, ... }:

{
  home.username = "daniellee";
  home.homeDirectory = "/home/daniellee";
  home.stateVersion = "26.05"; 

  imports = [
    ./hyprland.nix
    ./modules/waybar.nix
    ./modules/rofi.nix
    ./modules/nvf.nix
    ./modules/hyprlock.nix
    ./modules/hypridle.nix
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
  
  programs.kitty.enable = true;
  stylix.targets.kitty.enable = true;

  home.packages = with pkgs; [
    lf
    micro
    fastfetch
    swww
    localsend
    xdg-desktop-portal-gtk
    nautilus
    btop
    flavours
  ];
  
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
  
  home.sessionVariables = {
    PASSWORD_STORE_TYPE = "gnome";
  };


  programs.home-manager.enable = true;
}
