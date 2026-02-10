{ config, pkgs, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${./alpswallhaven.png}" ];
      wallpaper = [ ",${./alpswallhaven.png}" ];
    };
  };
}
