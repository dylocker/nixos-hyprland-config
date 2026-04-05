{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 20;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "backlight" "bluetooth" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };

        "clock" = {
          format = " {:%H:%M}";
          format-alt = " {:%A, %B %d, %Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        #"cpu" = {
          #format = " {usage}%";
          #tooltip = false;
        #};

        #"memory" = {
          #format = " {}%";
        #};

        #"temperature" = {
          #critical-threshold = 80;
          #format = "{icon} {temperatureC}°C";
          #format-icons = ["" "" ""];
        #};

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

		    "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        "bluetooth" = {
          format = " {status}";
          format-connected = " {device_alias}";
          format-connected-battery = " {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "${pkgs.blueman}/bin/blueman-manager";
        };

        "network" = {
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = " {ipaddr}/{cidr}";
          tooltip-format = " {ifname} via {gwaddr}";
          format-linked = " {ifname} (No IP)";
          format-disconnected = "⚠ Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          on-scroll-up = "light -A 1"; # Note: requires 'light' or 'brightnessctl' pkg
          on-scroll-down = "light -U 1";
        };
      };
    };


    style = ''
      * {
          border: none;
          font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free", Roboto, Arial, sans-serif;
          font-size: 9px;
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

     #clock, #pulseaudio, #network, #bluetooth, #battery, #tray, #backlight {
          padding: 0 8px;
          margin: 2px 2px;
          background-color: rgba(49, 50, 68, 0.5);
          border-radius: 6px;
      }

      #battery.critical:not(.charging) {
          background-color: #f38ba8;
          color: #11111b;
      }
    '';
  };
}
