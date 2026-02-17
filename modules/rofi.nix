{ pkgs, inputs, ... }:

{
  programs.rofi = {
  	enable = true;
  	theme = "onedark"
  	font = "Jetbrains Mono"
  	modes = [ "drun" "emoji" ]; 
  	plugins = [ pkgs.rofi-emoji ];
  };
}
