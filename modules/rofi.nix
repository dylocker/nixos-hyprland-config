{ pkgs, inputs, ... }:

{
  programs.rofi = {
  	enable = true;
  	font = "Jetbrains Mono";
  	modes = [ "drun" "emoji" "filebrowser" ]; 
  	plugins = [ pkgs.rofi-emoji ];
  	theme = ./rounded-template.rasi;
  		
  	};
  };
}
