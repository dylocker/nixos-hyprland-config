{ pkgs, config, lib, ... }:

{
  programs.rofi = {
    enable = true;
    modes = [ "drun" "emoji" ]; 
    plugins = [ pkgs.rofi-emoji ];

    extraConfig = {
      show-icons = true;
      icon-theme = "Papirus"; # Or your preferred icon theme
      display-drun = "";     # Optional: changes the search icon
      drun-display-format = "{name}"; # Removes the generic 'exec' info
    };
    
    theme = lib.mkForce (
      let
        inherit (config.lib.formats.rasi) mkLiteral;
        colors = config.lib.stylix.colors;
      in {
        "*" = {
          # base00 is usually the background, base05 is usually the main text.
          bg0 = mkLiteral "#${colors.base00}"; # Added 99 for transparency
          bg1 = mkLiteral "#${colors.base01}";
          bg2 = mkLiteral "#${colors.base02}";
          bg3 = mkLiteral "#${colors.base03}";
          fg0 = mkLiteral "#${colors.base05}";
          fg1 = mkLiteral "#${colors.base06}";
          fg2 = mkLiteral "#${colors.base0E}"; # Accent color (Purple-ish)
          fg3 = mkLiteral "#${colors.base0D}"; # Another accent (Blue-ish)

          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg0";
          margin = 0;
          padding = 0;
          spacing = 0;
        };

        "window" = {
          location = mkLiteral "north";
          y-offset = mkLiteral "calc(50% - 176px)";
          width = mkLiteral "480px";
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
          text-color = mkLiteral "@fg0";
        };

        "element-icon" = {
          size = mkLiteral "1.5em";
          vertical-align = mkLiteral "0.5";
        };

        "element-text" = {
          text-color = mkLiteral "inherit";
        };
      }
    );
  };
}
