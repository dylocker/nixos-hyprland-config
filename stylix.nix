{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ./wallpapers/snow.png; 
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    
    cursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 15;
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3";
      };
    };

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 12;
        terminal = 14;
        popups = 10;
      };
    };

    opacity = {
      terminal = 0.6;
      popups = 0.95;
    };
  };
}
