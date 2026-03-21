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
    ./modules/mako.nix
    ./modules/wlogout.nix
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
    settings = {
      user = {
        name = "dylocker";
        email = "dylocker@gmail.com";
      };
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
    cmatrix
    tty-clock
    tenki
    cava
    libreoffice-fresh
    papirus-icon-theme
  ];

  programs.yazi.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "*";
  };
  
  home.sessionVariables = {
    PASSWORD_STORE_TYPE = "gnome";
    EDITOR = "nvim";
    TERMINAL = "kitty";
    SAL_USE_VCLPLUGIN = "gtk3";
    FILE_MANAGER = "yazi";
  };

  programs.home-manager.enable = true;
}
