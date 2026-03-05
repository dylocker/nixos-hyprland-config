{ lib, ... }: {

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;
        
        theme = {
          enable = true;
          name = "nord";
          #style = "dark";
          transparent = true;
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
        
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          rust.enable = true;
        };
      };
    };
  };
}
