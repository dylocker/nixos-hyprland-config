{ pkgs, config, ... }:

{
  programs.rofi = {
  	enable = true;
  	font = "Jetbrains Mono";
  	modes = [ "drun" "emoji" "filebrowser" ]; 
  	plugins = [ pkgs.rofi-emoji ];
  	theme = let
  	      # Use inherit to pull the 'mkLiteral' function for raw Rofi strings/units
  	      inherit (config.lib.formats.rasi) mkLiteral;
  	    in {
  	      "*" = {
  	        # --- Color Palette (Adjust these to your liking) ---
  	        bg0 = mkLiteral "#11121D99";
  	        bg1 = mkLiteral "#21222C";
  	        bg2 = mkLiteral "#282A36";
  	        bg3 = mkLiteral "#44475A";
  	        fg0 = mkLiteral "#F8F8F2";
  	        fg1 = mkLiteral "#E6E6E6";
  	        fg2 = mkLiteral "#BD93F9";
  	        fg3 = mkLiteral "#6272A4";
  	
  	        background-color = mkLiteral "transparent";
  	        text-color = mkLiteral "@fg0";
  	        margin = 0;
  	        padding = 0;
  	        spacing = 0;
  	      };
  	
  	      "window" = {
  	        location = mkLiteral "north";
  	        y-offset = mkLiteral "calc(50% - 176px)";
  	        width = 480;
  	        border-radius = mkLiteral "24px";
  	        background-color = mkLiteral "@bg0";
  	      };
  	
  	      "mainbox" = {
  	        padding = mkLiteral "12px";
  	      };
  	
  	      "inputbar" = {
  	        background-color = mkLiteral "@bg1";
  	        border-color = mkLiteral "@bg3";
  	        border = 2;
  	        border-radius = mkLiteral "16px";
  	        padding = mkLiteral "8px 16px";
  	        spacing = mkLiteral "8px";
  	        children = mkLiteral "[ prompt, entry ]";
  	      };
  	
  	      "prompt" = {
  	        text-color = mkLiteral "@fg2";
  	      };
  	
  	      "entry" = {
  	        placeholder = "Search";
  	        placeholder-color = mkLiteral "@fg3";
  	      };
  	
  	      "message" = {
  	        margin = mkLiteral "12px 0 0";
  	        border-radius = mkLiteral "16px";
  	        border-color = mkLiteral "@bg2";
  	        background-color = mkLiteral "@bg2";
  	      };
  	
  	      "textbox" = {
  	        padding = mkLiteral "8px 24px";
  	      };
  	
  	      "listview" = {
  	        background-color = mkLiteral "transparent";
  	        margin = mkLiteral "12px 0 0";
  	        lines = 8;
  	        columns = 1;
  	        fixed-height = false;
  	      };
  	
  	      "element" = {
  	        padding = mkLiteral "8px 16px";
  	        spacing = mkLiteral "8px";
  	        border-radius = mkLiteral "16px";
  	      };
  	
  	      "element normal active" = {
  	        text-color = mkLiteral "@bg3";
  	      };
  	
  	      "element alternate active" = {
  	        text-color = mkLiteral "@bg3";
  	      };
  	
  	      "element selected normal, element selected active" = {
  	        background-color = mkLiteral "@bg3";
  	      };
  	
  	      "element-icon" = {
  	        size = mkLiteral "1em";
  	        vertical-align = mkLiteral "0.5";
  	      };
  	
  	      "element-text" = {
  	        text-color = mkLiteral "inherit";
  	      };
  		
  	};
  };
}
