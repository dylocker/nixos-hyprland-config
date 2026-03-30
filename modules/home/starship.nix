{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # This 'format' defines the rainbow sequence. 
      # Each segment has a background (bg) and foreground (fg).
      format = lib.concatStrings [
        "[](blue)"
        "$os"
        "$username"
        "[](fg:blue bg:magenta)"
        "$directory"
        "[](fg:magenta bg:cyan)"
        "$git_branch"
        "$git_status"
        "[](fg:cyan bg:yellow)"
        "$nodejs"
        "$rust"
        "$python"
        "$nix_shell"
        "[](fg:yellow bg:surface0)"
        "$time"
        "[ ](fg:surface0)"
        "$line_break$character"
      ];

      # Configure each module to use the background colors assigned above
      directory = {
        format = "[ $path ]($style)";
        style = "bg:magenta fg:base00"; # base00 is usually the background color in Stylix
      };

      git_branch = {
        symbol = "";
        format = "[ $symbol $branch ]($style)";
        style = "bg:cyan fg:base00";
      };

      git_status = {
        format = "[$all_status$ahead_behind ]($style)";
        style = "bg:cyan fg:base00";
      };

      nodejs = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "bg:yellow fg:base00";
      };

      rust = {
        symbol = "";
        format = "[ $symbol ($version) ]($style)";
        style = "bg:yellow fg:base00";
      };

      nix_shell = {
        symbol = "";
        format = "[ $symbol ]($style)";
        style = "bg:yellow fg:base00";
      };

      username = {
        show_always = true;
        style_user = "bg:blue fg:base00";
        style_root = "bg:blue fg:base00";
        format = "[ $user ]($style)";
      };

      os = {
        disabled = false;
        style = "bg:blue fg:base00";
      };

      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute
        style = "bg:surface0 fg:base05"; # base05 is usually text color
        format = "[ ♥ $time ]($style)";
      };
    }; 
  };
}
