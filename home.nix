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
    lf
    micro
    kitty
    fastfetch
    swww
    localsend
    xdg-desktop-portal-gtk
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
  
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 15;
  };
  
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
  };
  
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.6"; # 0.0 to 1.0
    };
  };

  programs.home-manager.enable = true;
}
