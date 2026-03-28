{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "hyprlock"
      "swww-daemon"
    ];

    input = {
      "kb_layout" = "ch";
      "kb_variant" = "fr";	
      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.7;
        tap-to-click = false;
      };
    };

    gesture = [
      "3, horizontal, workspace"
    ];

    gestures = {
        workspace_swipe_distance = 700; # How far you have to swipe
        workspace_swipe_invert = true; # Set to true for "natural" feel
        workspace_swipe_min_speed_to_force = 5; 
    };

    general = {
      border_size = 1;
      gaps_in = 5;
      gaps_out = 5;
      float_gaps = 0;
  	  resize_on_border = true;
      layout = "dwindle";
    };
    
    dwindle = {
      preserve_split = 1;
      force_split = 0;
    };

    decoration = {
      rounding = 10;
      blur = {
      enabled = true;
      size = 3;
      passes = 1;
    };
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };
    };

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    windowrule = [
      "match:class ^(pavucontrol)$, float 1"
      "match:class ^(blueman-manager)$, float 1"
      "match:class ^(nm-connection-editor)$, float 1"
      "match:title ^(Open File)$, float 1"
      "match:title ^(Volume Control)$, float 1"
    
      # Example for workspace assignment
      #"match:class ^(brave-browser)$, workspace 3"
    ];

  	  misc = {
  	    disable_hyprland_logo = true;
  	    disable_watchdog_warning = true;
  	  };
  	  
	  "$mod" = "SUPER";
  	  bind = [
  	    # Basic System Actions
  	    "$mod, Q, exec, kitty"                     # Open terminal (you can swap with 'foot')
  	    "$mod, C, killactive,"                     # Close focused window
  	    "$mod, M, exec, wlogout" 
  	    "$mod, E, exec, kitty -e yazi"                      # Open file manager
  	    "$mod, V, togglefloating,"                 # Toggle window between floating/tiled
        "$mod, F, fullscreen, toggle"
  	    "$mod, R, exec, rofi -show drun"           # Open app launcher
  	    "$mod, P, pseudo,"                         # Dwindle (pseudo-tiling)
  	    "$mod, J, togglesplit,"                    # Dwindle (split orientation)
        "$mod, B, exec, brave"
  	    "$mod, W, exec, pkill waybar && waybar &"
  	    # Focus Movement (Vim-style or Arrow keys)
  	    "$mod, left, movefocus, l"
  	    "$mod, right, movefocus, r"
  	    "$mod, up, movefocus, u"
  	    "$mod, down, movefocus, d"
  	  
  	    # Switch Workspaces
  	    "$mod, 1, workspace, 1"
  	    "$mod, 2, workspace, 2"
  	    "$mod, 3, workspace, 3"
  	    "$mod, 4, workspace, 4"
  	    "$mod, 5, workspace, 5"
  	    "$mod, 6, workspace, 6"
  	    "$mod, 7, workspace, 7"
  	    "$mod, 8, workspace, 8"
  	    "$mod, 9, workspace, 9"
  	    "$mod, 0, workspace, 10"
  	
        # Move Active Window to Workspace
  	    "$mod SHIFT, 1, movetoworkspace, 1"
  	    "$mod SHIFT, 2, movetoworkspace, 2"
  	    "$mod SHIFT, 3, movetoworkspace, 3"
  	    "$mod SHIFT, 4, movetoworkspace, 4"
  	    "$mod SHIFT, 5, movetoworkspace, 5"
  	    "$mod SHIFT, 6, movetoworkspace, 6"
  	    "$mod SHIFT, 7, movetoworkspace, 7"
  	    "$mod SHIFT, 8, movetoworkspace, 8"
  	    "$mod SHIFT, 9, movetoworkspace, 9"
  	    "$mod SHIFT, 0, movetoworkspace, 10"
  	  
  	    # Scratchpad (Special Workspace)
  	    "$mod, S, togglespecialworkspace, magic"
  	    "$mod SHIFT, S, movetoworkspace, special:magic"
  	  
  	    # Scroll through workspaces with mouse wheel
  	    "$mod, mouse_down, workspace, e+1"
  	    "$mod, mouse_up, workspace, e-1"
  	  ];
      bindm = [
 	      "$mod, mouse:272, movewindow"
  	    "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
  	  bindel = [
  	    # Volume keys (e = repeat, l = works on lockscreen)
  	    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
  	    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
  	          
  	    # Brightness keys
  	    ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
  	    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
  	    
 	    bindl = [
  	    # Media control and Mute (l = works on lockscreen)
  	    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
  	    ", XF86AudioPrev, exec, playerctl previous"
      ];
  	};
  };
}

