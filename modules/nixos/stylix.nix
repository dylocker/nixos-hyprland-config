{ pkgs, inputs, ... }:

{

  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;

    image = ../../assets/wallpapers/goose.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
                
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 15;
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
        terminal = 10;
        popups = 10;
      };
    };
   
    opacity = {
      terminal = 0.7;
      popups = 0.95;
    };
  };
}
