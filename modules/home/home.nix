{  pkgs, ... }:

{
  home.username = "daniellee";
  home.homeDirectory = "/home/daniellee";
  home.stateVersion = "26.05"; 

  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./rofi.nix
    ./nvf.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./mako.nix
    ./wlogout.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];

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
  
# Zoxide: 'z' replaces 'cd' and learns your habits
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # Fzf: 'Ctrl+R' to search history and 'Alt+C' to find files
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  stylix.targets.kitty.enable = true;
  stylix.targets.starship.enable = true;
  stylix.targets.qt.enable = false;

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
    spotify
    discord
    tree
    adwaita-icon-theme
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
