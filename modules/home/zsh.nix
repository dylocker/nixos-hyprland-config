{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
    };

    shellAliases = {
      # Use eza (modern ls) if you have it enabled
      ls = "eza --icons --group-directories-first";
      ll = "eza -lh --icons --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      tree = "eza --tree --icons";

      # NixOS specific shortcuts
      nos = "sudo nixos-rebuild switch --flake .";
      nclean = "sudo nix-collect-garbage -d && nix-collect-garbage -d";

      # Quick navigation
      ".." = "cd ..";
      "..." = "cd ../..";
    };

    # Handy initialization commands
    initExtra = ''
      # Better search with arrow keys
      bindkey '^[[A' up-line-or-search
      bindkey '^[[B' down-line-or-search
      
      # Make Vi mode more comfortable if you use it
      # bindkey -v
    '';
  };
}
