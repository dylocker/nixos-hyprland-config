{ lib, config, ... }: {

  programs.nvf = lib.mkForce {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        
        theme = {
          enable = true;
          name = "base16";
          style = "dark";
          transparent = true;
          base16-colors = {
            base00 = config.lib.stylix.colors.base00;
            base01 = config.lib.stylix.colors.base01;
            base02 = config.lib.stylix.colors.base02;
            base03 = config.lib.stylix.colors.base03;
            base04 = config.lib.stylix.colors.base04;
            base05 = config.lib.stylix.colors.base05;
            base06 = config.lib.stylix.colors.base06;
            base07 = config.lib.stylix.colors.base07;
            base08 = config.lib.stylix.colors.base08;
            base09 = config.lib.stylix.colors.base09;
            base0A = config.lib.stylix.colors.base0A;
            base0B = config.lib.stylix.colors.base0B;
            base0C = config.lib.stylix.colors.base0C;
            base0D = config.lib.stylix.colors.base0D;
            base0E = config.lib.stylix.colors.base0E;
            base0F = config.lib.stylix.colors.base0F;
          };
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        autopairs.nvim-autopairs.enable = true;
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };
          
        options.clipboard = lib.mkForce "unnamedplus";
        
        options = {
          tabstop = 2;      # The width of a tab character
          shiftwidth = 2;   # The number of spaces inserted for indentation
          expandtab = true;  # Convert tabs to spaces
        };
       
        lsp.enable = true;

        languages = {
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
        };
      };
    };
  };
}
