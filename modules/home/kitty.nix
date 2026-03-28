{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    settings = {
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = "yes";

      scrollback_lines = 10000;
      enable_audio_bell = false;
      confirm_os_window_close = 0; 
      copy_on_select = "clipboard";
      
      window_padding_width = 12; 
      placement_strategy = "center";
      
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
    };
  };
}
