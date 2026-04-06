{ inputs, pkgs, lib, ... }: 

{
  
  imports = [ inputs.niri-flake.nixosModules.niri ];
  programs.niri = {
    enable = true;
    input.keyboard = {
      xkb.layout = "ch,fr";
    }
    layout.gaps = 5;
    binds = {
      "Mod+Return" = { action = spawn "kitty"; };
      "Mod+Q".close-window = null;
    };
  };
}
