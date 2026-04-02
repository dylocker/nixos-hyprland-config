{ lib, config, ... }:

let
  # Access the Stylix color palette
  palette = config.lib.stylix.colors;
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # We use #hex codes here so Starship gets the exact theme colors
      format = lib.concatStrings [
        "[](#${palette.base0D})" # Start (Blue)
        "$os"
        "$username"
        "[](fg:#${palette.base0D} bg:#${palette.base0E})" # Blue to Magenta
        "$directory"
        "[](fg:#${palette.base0E} bg:#${palette.base0C})" # Magenta to Cyan
        "$git_branch"
        "$git_status"
        "[](fg:#${palette.base0C} bg:#${palette.base0A})" # Cyan to Yellow
        "$nodejs"
        "$rust"
        "$python"
        "$nix_shell"
        "[](fg:#${palette.base0A} bg:#${palette.base02})" # Yellow to Surface/Base02
        "$time"
        "[ ](fg:#${palette.base02})" # End
        "$line_break$character"
      ];

      directory = {
        format = "[ $path ]($style)";
        style = "bg:#${palette.base0E} fg:#${palette.base00}";
      };

      git_branch = {
        symbol = "";
        format = "[ $symbol $branch ]($style)";
        style = "bg:#${palette.base0C} fg:#${palette.base00}";
      };

      git_status = {
        format = "[$all_status$ahead_behind ]($style)";
        style = "bg:#${palette.base0C} fg:#${palette.base00}";
      };

      nodejs = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "bg:#${palette.base0A} fg:#${palette.base00}";
      };

      rust = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "bg:#${palette.base0A} fg:#${palette.base00}";
      };

      nix_shell = {
        symbol = "";
        format = "[ $symbol ]($style)";
        style = "bg:#${palette.base0A} fg:#${palette.base00}";
      };

      username = {
        show_always = true;
        style_user = "bg:#${palette.base0D} fg:#${palette.base00}";
        style_root = "bg:#${palette.base0D} fg:#${palette.base00}";
        format = "[ $user ]($style)";
      };

      os = {
        disabled = false;
        style = "bg:#${palette.base0D} fg:#${palette.base00}";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#${palette.base02} fg:#${palette.base05}";
        format = "[ ♥ $time ]($style)";
      };
      
      character = {
        success_symbol = "[➜](bold #${palette.base0B})"; # Green for success
        error_symbol = "[➜](bold #${palette.base08})";   # Red for error
      };
    };
  };
}
