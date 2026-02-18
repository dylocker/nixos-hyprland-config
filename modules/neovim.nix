{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    # Install plugins via Nix
    extraPackages = with pkgs; [
      vimPlugins.nvim-treesitter
      vimPlugins.nvim-lspconfig
      vimPlugins.nvim-cmp
    ];

    # Install language servers and formatters
    extraPlugins = with pkgs; [
      pyright
      lua-language-server
      ruff
      stylua
    ];

    # Use a custom config file managed by Home Manager
    xdg.configFile."nvim/init.lua".source = ./dotfiles/nvim/init.lua;
  };
}   
