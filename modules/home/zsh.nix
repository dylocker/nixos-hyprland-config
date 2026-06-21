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
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
  ];

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
    
    completionInit = "autoload -U compinit && compinit";

    # 3. Inject the Instant Prompt at the absolute top of ~/.zshrc
    initExtraFirst = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input should be run below this.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    # 4. Source your configuration file at the bottom
    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
    initContent = ''
    '';
  };
}
