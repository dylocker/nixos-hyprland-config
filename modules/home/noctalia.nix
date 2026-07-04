{ lib, ... }:

{
  programs.noctalia = {
    enable = true;
    settings = lib.mkForce {
      audio = {
        enable_overdrive = false;
        enable_sounds = false;
        notification_sound = "";
        sound_volume = 0.5;
        volume_change_sound = "";
      };

      backdrop = {
        blur_intensity = 0.5;
        enabled = false;
        tint_intensity = 0.30000001192092896;
      };

      bar = {
        order = [ "widgets" ];

        widgets = {
          auto_hide = false;
          background_opacity = 0.89999997615814209;
          border = "outline";
          border_width = 0.0;
          capsule = false;
          capsule_fill = "surface_variant";
          capsule_group = [ ];
          capsule_opacity = 1.0;
          capsule_padding = 6.0;
          capsule_thickness = 0.75999999046325684;
          center = [ "wallpaper" "spacer_2" "workspaces" "spacer_2" "notifications" ];
          contact_shadow = false;
          enabled = true;
          end = [
            "tray"
            "keyboard_layout"
            "clipboard"
            "network"
            "bluetooth"
            "brightness"
            "volume"
            "battery"
            "session"
          ];
          font_weight = 700;
          layer = "top";
          margin_edge = 0;
          margin_ends = 0;
          padding = 14;
          panel_overlap = 1;
          position = "top";
          radius = 0;
          radius_bottom_left = 0;
          radius_bottom_right = 0;
          radius_top_left = 0;
          radius_top_right = 0;
          reserve_space = true;
          scale = 1.0;
          shadow = false;
          start = [ "date" "clock" "spacer_2" "media" "audio_visualizer" ];
          thickness = 34;
          widget_spacing = 6;
        };
      };

      battery.warning_threshold = 20;

      brightness = {
        enable_ddcutil = false;
        ignore_mmids = [ ];
      };

      calendar = {
        enabled = false;
        refresh_minutes = 15;
      };

      control_center = {
        sidebar = "compact";
        sidebar_section = "compact";
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
          { type = "notification"; }
          { type = "power_profile"; }
        ];
      };

      desktop_widgets = {
        enabled = true;
        schema_version = 2;
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
      };

      dock = {
        active_monitor_only = false;
        active_opacity = 1.0;
        active_scale = 1.0;
        auto_hide = false;
        background_opacity = 0.87999999523162842;
        cross_axis_padding = 8;
        enabled = false;
        icon_size = 48;
        inactive_opacity = 0.85000002384185791;
        inactive_scale = 0.85000002384185791;
        item_spacing = 6;
        launcher_icon = "grid-dots";
        launcher_position = "none";
        magnification = true;
        magnification_scale = 1.4500000476837158;
        main_axis_padding = 16;
        margin_edge = 8;
        margin_ends = 0;
        monitors = [ ];
        pinned = [ ];
        position = "bottom";
        radius = 16;
        radius_bottom_left = 16;
        radius_bottom_right = 16;
        radius_top_left = 16;
        radius_top_right = 16;
        reserve_space = true;
        shadow = true;
        show_dots = false;
        show_instance_count = true;
        show_running = true;
      };

      hooks = {
        battery_charging = [ ];
        battery_discharging = [ ];
        battery_percentage_changed = [ ];
        battery_plugged = [ ];
        bluetooth_disabled = [ ];
        bluetooth_enabled = [ ];
        colors_changed = [ ];
        logging_out = [ ];
        power_profile_changed = [ ];
        rebooting = [ ];
        session_locked = [ ];
        session_unlocked = [ ];
        shutting_down = [ ];
        started = [ ];
        theme_mode_changed = [ ];
        wallpaper_changed = [ ];
        wifi_disabled = [ ];
        wifi_enabled = [ ];
      };

      idle = {
        behavior_order = [ "lock" "screen-off" "lock-and-suspend" ];
        pre_action_fade_seconds = 2.0;

        behavior = {
          lock = {
            action = "lock";
            command = "";
            enabled = true;
            resume_command = "";
            timeout = 300;
          };

          "lock-and-suspend" = {
            action = "lock_and_suspend";
            command = "";
            enabled = false;
            resume_command = "";
            timeout = 900;
          };

          "screen-off" = {
            action = "screen_off";
            command = "";
            enabled = true;
            resume_command = "";
            timeout = 360;
          };
        };
      };

      keybinds = {
        cancel = [ "Escape" ];
        down = [ "Down" ];
        left = [ "Left" ];
        right = [ "Right" ];
        up = [ "Up" ];
        validate = [ "Return" "KP_Enter" ];
      };

      location = {
        address = "Yverdon-les-Bains, Switzerland";
        auto_locate = false;
        sunrise = "";
        sunset = "";
      };

      lockscreen = {
        blur_intensity = 0.79999995231628418;
        blurred_desktop = false;
        enabled = true;
        fingerprint = true;
        monitors = [ ];
        tint_intensity = 0.30000001192092896;
        wallpaper = "";
      };

      nightlight = {
        enabled = false;
        force = false;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      notification = {
        background_opacity = 0.97000002861022949;
        collapse_on_dismiss = true;
        enable_daemon = true;
        layer = "top";
        monitors = [ ];
        offset_x = 20;
        offset_y = 8;
        position = "top_right";
        scale = 1.0;
        show_actions = true;
        show_app_name = true;
      };

      osd = {
        background_opacity = 0.97000002861022949;
        monitors = [ ];
        offset_x = 20;
        offset_y = 8;
        orientation = "horizontal";
        position = "top_center";
        scale = 1.0;
        kinds = {
          bluetooth = true;
          brightness = true;
          caffeine = true;
          dnd = true;
          keyboard_layout = true;
          lock_keys = true;
          power_profile = true;
          volume = true;
          volume_input = true;
          volume_output = true;
          wifi = true;
        };
      };

      plugins = {
        enabled = [ ];
        source = [
          {
            auto_update = false;
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            name = "official";
          }
          {
            auto_update = false;
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            name = "community";
          }
        ];
      };

      shell = {
        app_icon_colorize = false;
        avatar_path = "";
        clipboard_auto_paste = "auto";
        clipboard_confirm_clear_history = true;
        clipboard_enabled = true;
        clipboard_history_max_entries = 100;
        clipboard_image_action_command = "";
        corner_radius_scale = 1.0;
        date_format = "%A, %x";
        disable_mipmaps = false;
        font_family = "JetBrains Mono";
        launch_apps_as_systemd_services = false;
        middle_click_opens_widget_settings = true;
        niri_overview_type_to_launch_enabled = false;
        offline_mode = false;
        password_style = "default";
        polkit_agent = false;
        screen_time_enabled = false;
        settings_show_advanced = false;
        setup_wizard_enabled = true;
        shared_gl_context = true;
        show_location = true;
        telemetry_enabled = false;
        time_format = "{:%H:%M}";
        ui_scale = 1.1000000238418579;

        animation = {
          enabled = true;
          speed = 1.0;
        };

        mpris.blacklist = [ ];

        panel = {
          borders = true;
          clipboard_placement = "centered";
          control_center_placement = "attached";
          launcher_categories = false;
          launcher_compact = true;
          launcher_placement = "centered";
          launcher_session_search = false;
          launcher_show_icons = true;
          launcher_sort_by_usage = true;
          open_near_click_clipboard = false;
          open_near_click_control_center = false;
          open_near_click_launcher = false;
          open_near_click_session = false;
          open_near_click_wallpaper = false;
          session_placement = "attached";
          shadow = true;
          transparency_mode = "solid";
          wallpaper_placement = "attached";
        };

        screen_corners = {
          enabled = false;
          size = 32;
        };

        screenshot = {
          copy_to_clipboard = true;
          directory = "";
          filename_pattern = "";
          freeze_screen = true;
          pipe_command = "";
          pipe_to_command = false;
          save_to_file = true;
        };

        session.actions = [
          {
            action = "lock";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "1";
            variant = "default";
          }
          {
            action = "logout";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "2";
            variant = "default";
          }
          {
            action = "lock_and_suspend";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "3";
            variant = "default";
          }
          {
            action = "reboot";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "4";
            variant = "default";
          }
          {
            action = "shutdown";
            command = "";
            enabled = true;
            glyph = "";
            label = "";
            shortcut = "5";
            variant = "destructive";
          }
        ];

        shadow = {
          alpha = 0.55000001192092896;
          direction = "down";
        };
      };

      system.monitor = {
        cpu_poll_seconds = 2.0;
        cpu_temp_activity_threshold = 60.0;
        cpu_temp_critical_threshold = 85.0;
        cpu_temp_sensor_path = "";
        cpu_usage_activity_threshold = 50.0;
        cpu_usage_critical_threshold = 90.0;
        disk_pct_activity_threshold = 80.0;
        disk_pct_critical_threshold = 95.0;
        disk_poll_seconds = 10.0;
        enabled = true;
        gpu_poll_seconds = 0.0;
        gpu_temp_activity_threshold = 60.0;
        gpu_temp_critical_threshold = 85.0;
        gpu_usage_activity_threshold = 50.0;
        gpu_usage_critical_threshold = 95.0;
        gpu_vram_activity_threshold = 50.0;
        gpu_vram_critical_threshold = 90.0;
        memory_poll_seconds = 2.0;
        net_rx_activity_threshold = 1.0;
        net_rx_critical_threshold = 50.0;
        net_tx_activity_threshold = 1.0;
        net_tx_critical_threshold = 50.0;
        network_poll_seconds = 3.0;
        ram_pct_activity_threshold = 60.0;
        ram_pct_critical_threshold = 90.0;
        swap_pct_activity_threshold = 20.0;
        swap_pct_critical_threshold = 80.0;
      };

      theme = {
        builtin = "Catppuccin";
        community_palette = "Kanagawa Paper";
        custom_palette = "";
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "vibrant";
        templates = {
          builtin_ids = [ ];
          community_ids = [ ];
          enable_builtin_templates = true;
          enable_community_templates = true;
        };
      };

      wallpaper = {
        directory = "/home/daniellee/.dotfiles/assets/wallpapers";
        directory_dark = "";
        directory_light = "";
        edge_smoothness = 0.30000001192092896;
        enabled = true;
        fill_color = "";
        fill_mode = "crop";
        per_monitor_directories = false;
        transition = [ "fade" "wipe" "disc" "stripes" "zoom" "honeycomb" ];
        transition_duration = 1500.0;
        transition_on_startup = false;
        automation = {
          enabled = false;
          interval_seconds = 1800;
          order = "random";
          recursive = true;
        };
      };

      weather = {
        effects = true;
        enabled = true;
        refresh_minutes = 30;
        unit = "metric";
      };

      widget = {
        active_window = {
          icon_size = 14.0;
          max_length = 260.0;
          min_length = 80.0;
          title_scroll = "none";
          type = "active_window";
        };

        audio_visualizer = {
          scale = 1.2;
          type = "audio_visualizer";
        };

        bongocat = {
          script = "scripts/bongocat.lua";
          type = "scripted";
        };

        cpu = {
          stat = "cpu_usage";
          type = "sysmon";
        };

        date = {
          format = "{:%a %d %b}";
          type = "clock";
        };

        input_volume = {
          device = "input";
          type = "volume";
        };

        keyboard_layout = {
          cycle_command = "";
          hide_when_single_layout = false;
          type = "keyboard_layout";
          custom_labels = {
            "English (US, intl., with dead keys)" = "US";
          };
        };

        lock_keys = {
          display = "short";
          hide_when_off = false;
          show_caps_lock = true;
          show_num_lock = true;
          show_scroll_lock = false;
          type = "lock_keys";
        };

        media = {
          art_size = 16.0;
          max_length = 220.0;
          min_length = 80.0;
          title_scroll = "always";
          type = "media";
        };

        network = {
          show_label = false;
          type = "network";
        };

        network_rx = {
          stat = "net_rx";
          type = "sysmon";
        };

        network_tx = {
          stat = "net_tx";
          type = "sysmon";
        };

        output_volume = {
          device = "output";
          type = "volume";
        };

        ram = {
          stat = "ram_used";
          type = "sysmon";
        };

        screen_recorder = {
          script = "scripts/screen_recorder.lua";
          type = "scripted";
        };

        spacer = {
          type = "spacer";
        };

        spacer_2 = {
          length = 40;
          scale = 0.30000000000000004;
          type = "spacer";
        };

        temp = {
          stat = "cpu_temp";
          type = "sysmon";
        };

        workspaces = {
          capsule_opacity = 0.0;
          type = "workspaces";
        };
      };
    };
  };
}
