{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
      source = "nixos_small";
      padding = {
        right = 1;
      };
      };
      display = {
        size = {
        binaryPrefix = "si";
        };
        separator = " ";
        key = {
          type = "both";      # This enables the "padding" characters
          width = 15;
          paddingLeft = 1;    # Space inside the box
          paddingRight = 1;   # Space inside the box
        };
      };

      display.key.open = "║"; 
      display.key.close = "║";

      modules = [
        {
          type = "os";
          key = "OS";
          format = "{2} {8}";
        }
        {
          type = "kernel";
          key = "Kernel";
        }
        {
          type = "shell";
          key = "Shell";
        }
       {
          type = "wm";
          key = "WM";
        }
        {
          type = "terminal";
          key = "Terminal";
        }
        {
          type = "display";
          key = "Display";
        }
        {
          type = "cpu";
          key = "CPU";
        }
        {
          type = "gpu";
          key = "GPU";
        }
        {
          type = "disk";
          key = "Disk";
          folders = "/";
        }
        "media"
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
