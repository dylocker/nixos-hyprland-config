{ lib, ... }:

{
  programs.hyprlock = lib.mkForce {
    enable = true;
    # All your configuration must go inside this 'settings' block
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        # Syntax: animation = NAME, ENABLED, DURATION, CURVE
        bezier = "simple, 0.5, 0.1, 0.1, 1.0";
        animation = [
          "fadeIn, 1, 5, simple"
          "fadeOut, 1, 5, simple"
        ];
      };
                        
      background = [
        {
          path = "${../../assets/wallpapers/goose.png}";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      label = [
        # The Clock
        {
          monitor = "";
          text = "$TIME"; 
          font_size = 64;
          font_family = "Inter Bold"; 
          position = "0, 80";
          halign = "center";
          valign = "center";
        #color = "rgb(202, 211, 245)"; # Catppuccin Macchiato Text
        }
        # The Date
        {
          monitor = "";
          text = "cmd[update:43200000] echo \"$(date +'%A, %d %B')\"";
          font_size = 24;
          font_family = "Inter";
          position = "0, 20";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = " ";
          shadow_passes = 0;
        }
      ];
    };
  };
}
