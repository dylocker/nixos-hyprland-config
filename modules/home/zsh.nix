{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 1000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
    };

    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -lh --icons --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      tree = "eza --tree --icons";
      noslap = "sudo nixos-rebuild switch --flake .#nixos_laptop";
      nosdes = "sudo nixos-rebuild switch --flake .#nixos_desktop";
      nclean = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
    
    initContent = ''
      # --- 4. Keybindings ---
      bindkey '^[[A' up-line-or-search
      bindkey '^[[B' down-line-or-search
    '';
  };
}
