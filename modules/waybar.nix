{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 26;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "temperature" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        "clock" = {
          format = " {:%H:%M}";
          format-alt = " {:%A, %B %d, %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = " {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = " {}%";
        };

        "temperature" = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" ""];
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = ["" "" "" "" ""];
        };

        "tray" = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
          border: none;
          font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free", Roboto, Arial, sans-serif;
          font-size: 11px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(21, 18, 27, 0.8);
          color: #cdd6f4;
          border-bottom: 2px solid rgba(255, 255, 255, 0.1);
      }

      #workspaces button {
          padding: 0 5px;
          color: #cdd6f4;
      }

      #workspaces button.active {
          color: #b4befe;
          border-bottom: 2px solid #b4befe;
      }

      #clock, #cpu, #memory, #temperature, #battery, #tray {
          padding: 0 8px;
          margin: 2px 2px;
          background-color: rgba(49, 50, 68, 0.5);
          border-radius: 8px;
      }

      #battery.critical:not(.charging) {
          background-color: #f38ba8;
          color: #11111b;
      }
    '';
  };
}
