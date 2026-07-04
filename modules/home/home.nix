{  pkgs, ... }:

{
  home.username = "daniellee";
  home.homeDirectory = "/home/daniellee";
  home.stateVersion = "26.05"; 

  imports = [
    ./nvf.nix
    ./kitty.nix
    ./zsh.nix
    ./fastfetch.nix
    ./niri.nix
    ./noctalia.nix
  ];
  
  home.file.".p10k.zsh".source = ./p10k.zsh;
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
  
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  stylix.targets.kitty.enable = true;

  stylix.targets.qt.enable = true;
  stylix.targets.noctalia-shell.enable = true;

  home.packages = with pkgs; [
    lf
    awww
    localsend
    xdg-desktop-portal-gtk
    nautilus
    btop
    cmatrix
    cava
    libreoffice-fresh
    papirus-icon-theme
    spotify
    discord
    tree
    adwaita-icon-theme
    obsidian
    nitch
    codex
    anki
    blender
    krita
    audacity
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
