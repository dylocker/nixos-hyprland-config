{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    
    borderRadius = 8;
    borderSize = 2;
    padding = "15";
    margin = "10";
    width = 300;
    height = 150;
    
    anchor = "top-right";
    defaultTimeout = 5000; # 5 seconds
    layer = "overlay";     # Shows above full-screen apps
    sort = "-time";        # Newest on top
    
    # These settings refine how notifications interact
    extraConfig = ''
      max-history=100
      
      # Group notifications by app name
      group-by=app-name
      
      # Specific rule for "low battery" (stays until dismissed)
      [urgency=high]
      border-color=#ff5555
      default-timeout=0
      
      # Ignore "Spotify" track changes if they are too annoying
      # [app-name=Spotify]
      # invisible=1
    '';
  };
}
