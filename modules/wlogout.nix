{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = " ";
        keybind = "l";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = " ";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = " ";
        keybind = "s";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = " ";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = " ";
        keybind = "u";
      }
    ];
  };
}
