{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;

      format = lib.concatStrings [
        "$os"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nix_shell"
        "$c"
        "$rust"
        "$nodejs"
        "$python"
        "$line_break"
        "$character"
      ];

      character = {
        success_symbol = "[󱞩](bold green)";
        error_symbol = "[󱞩](bold red)";
      };

      directory = {
        truncation_length = 3;
        truncate_to_repo = true;
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      git_branch = {
        symbol = " ";
        format = "on [$symbol$branch]($style) ";
      };

      nix_shell = {
        symbol = " ";
        format = "via [$symbol$state( \($name\))]($style) ";
      };

      # Disable annoying package version alerts
      package.disabled = true;
    };
  };
}
