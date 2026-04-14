{ pkgs, ... }: 

{
  home.packages = [ pkgs.xwayland-satellite ];

  programs.niri = {
    enable = true;
    package = pkgs.niri; 

    settings = {
      spawn-at-startup = [
        { command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ]; }
        { command = [ "noctalia-shell" ]; }
      ];
      
      outputs."eDP-1" = { # Replace "eDP-1" with your screen name (run 'niri msg outputs' to find it)
        scale = 1.2;      # Try 1.25, 1.5, or 2.0
      };
      input = {
        keyboard.xkb.layout = "ch,fr";
        touchpad.tap = false;

        focus-follows-mouse = {
          enable = true;
        };
      };

      layout = {
        gaps = 8;
        focus-ring.enable = false;
        border = {
          enable = false;
          width = 2;
        };
        default-column-width.proportion = 0.5;
        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
      };

      animations = {
        slowdown = 1.0; 
        # You can customize individual workspace/window transitions here
        # "spring" is the secret to that bouncy feel
        workspace-switch = {
          spring = { 
            damping-ratio = 0.8; 
            stiffness = 1000; 
            epsilon = 0.001;
          };
        };
      };

      binds = {
        # --- Essentials ---
        "Mod+Q".action.spawn = "kitty";
        "Mod+B".action.spawn = "brave";
        "Mod+D".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
        "Mod+C".action.close-window = { };
        "Mod+Shift+E".action.quit = { }; # Exit Niri
        "Mod+E".action.spawn = ["kitty" "-e" "yazi"];
        "Mod+O".action.toggle-overview = { };

        # --- Focus (Navigation) ---
        "Mod+Left".action.focus-column-left = { };
        "Mod+Right".action.focus-column-right = { };
        "Mod+Up".action.focus-window-or-workspace-up = { };
        "Mod+Down".action.focus-window-or-workspace-down = { };
        
        # Vim-style navigation
        "Mod+H".action.focus-column-left = { };
        "Mod+L".action.focus-column-right = { };
        "Mod+K".action.focus-window-or-workspace-up = { };
        "Mod+J".action.focus-window-or-workspace-down = { };

        # --- Moving Windows ---
        "Mod+Shift+Left".action.move-column-left = { };
        "Mod+Shift+Right".action.move-column-right = { };
        "Mod+Shift+H".action.move-column-left = { };
        "Mod+Shift+L".action.move-column-right = { };
        "Alt+L".action.consume-or-expel-window-right = { };
        "Alt+H".action.consume-or-expel-window-left = { };

        # --- Workspaces (Niri calls them "Workspaces" but they act like stacks) ---
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;

        # --- Window Resizing ---
        "Mod+R".action.switch-preset-column-width = { };
        "Mod+F".action.maximize-column = { };
        "Mod+Shift+F".action.fullscreen-window = { };
        "Mod+V".action.toggle-window-floating = { };
        
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+period".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+period".action.set-window-height = "+10%";
        
        # --- Mouse scroll wheel ---
        # Scroll through columns with Mod + Mouse Wheel
        "Mod+WheelScrollDown".action.focus-column-right = { };
        "Mod+WheelScrollUp".action.focus-column-left = { };
        # Scroll through windows within a column with Mod + Shift + Mouse Wheel
        "Mod+Shift+WheelScrollDown".action.focus-window-down = { };
        "Mod+Shift+WheelScrollUp".action.focus-window-up = { };

        # --- Screenshot ---
        "Print".action.screenshot = { };
        "Mod+Print".action.screenshot-screen = { };
        "Alt+Print".action.screenshot-window = { };
        "XF86MonBrightnessUp".action.spawn = [ "brightnessctl" "set" "5%+" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];

        # --- Audio Controls ---
        "XF86AudioRaiseVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" ];
        "XF86AudioLowerVolume".action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-" ];
        "XF86AudioMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
        "XF86AudioMicMute".action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];

        # --- Media Controls (Play/Pause/Next) ---
        "XF86AudioPlay".action.spawn = [ "playerctl" "play-pause" ];
        "XF86AudioNext".action.spawn = [ "playerctl" "next" ];
        "XF86AudioPrev".action.spawn = [ "playerctl" "previous" ];
      };
    };
  };
}
