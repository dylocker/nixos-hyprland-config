{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "000000"; # Forced black background
      base01 = "1f2943";
      base02 = "4e566a";
      base03 = "7d8391";
      base04 = "abafb8";
      base05 = "dadcdf"; # Main text color
      base06 = "ffffff";
      base07 = "ffffff";
      base08 = "3576dd"; 
      base09 = "5c79ab";
      base0A = "a9608e";
      base0B = "a36b42";
      base0C = "5278b9";
      base0D = "5674cc";
      base0E = "4a73dc";
      base0F = "4970ea";
    };
    image = ../../assets/wallpapers/snow.png;
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
                
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
      terminal = 0.6;
      popups = 0.95;
    };
  };
}
