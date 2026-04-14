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
      ls = "eza --icons --group-directories-first";
      ll = "eza -lh --icons --group-directories-first";
      la = "eza -a --icons --group-directories-first";
      tree = "eza --tree --icons";
      nos = "sudo nixos-rebuild switch --flake .#nixos";
      nclean = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
    
    initContent = ''
      # --- 1. Fast Completion Initialization ---
      # This prevents Zsh from re-scanning the entire Nix store every time Kitty opens.
      # It only does a full check if the cache is older than 24 hours.
      autoload -Uz compinit
      for dump in ~/.zcompdump(N.m-1); do
        compinit -C
      done
      compinit -i

      zstyle ':completion:*' use-cache yes
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

      # --- 2. Input Lag & Performance Tweaks ---
      # Use async mode for suggestions so they don't block your typing
      export ZSH_AUTOSUGGEST_USE_ASYNC=1
      # Don't try to suggest things if the command is too long (prevents lag)
      export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
      # Prevent slow history disk IO while typing
      export ZSH_AUTOSUGGEST_MANUAL_REBIND=1

      # --- 3. Starship Optimization (If enabled in home-manager) ---
      # If you find the prompt specifically is slow, you can cache the init script:
      if [[ -f ~/.cache/starship_init.zsh ]]; then
        source ~/.cache/starship_init.zsh
      else
        starship init zsh > ~/.cache/starship_init.zsh
        source ~/.cache/starship_init.zsh
      fi

      # --- 4. Keybindings ---
      bindkey '^[[A' up-line-or-search
      bindkey '^[[B' down-line-or-search
    '';
  };
}
