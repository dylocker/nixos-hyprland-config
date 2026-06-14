{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Cleaned layout without the raw powerline text arrows
      format = lib.concatStrings [
        "$os"
        "$username"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nodejs"
        "$rust"
        "$python"
        "$nix_shell"
        "$time"
        "$line_break$character"
      ];

      directory = {
        format = "[$path]($style) ";
      };

      git_branch = {
        symbol = " ";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
      };

      nodejs = {
        symbol = " ";
        format = "[$symbol($version)]($style) ";
      };

      rust = {
        symbol = " ";
        format = "[$symbol($version)]($style) ";
      };

      nix_shell = {
        symbol = " ";
        format = "[$symbol]($style) ";
      };

      username = {
        show_always = true;
        format = "[$user]($style) ";
      };

      os = {
        disabled = false;
      };

      time = {
        disabled = false;
        time_format = "%R";
        format = "[♥ $time]($style) ";
      };
      
      character = {
        success_symbol = "➜ ";
        error_symbol = "➜ "; 
      };
    };
  };
}
