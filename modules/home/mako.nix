{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    
    # All these options moved into the 'settings' block
    settings = {
      # Visuals
      "border-radius" = 8;
      "border-size" = 2;
      padding = 15;
      margin = 10;
      width = 300;
      height = 150;
      
      # Behavior
      anchor = "top-right";
      "default-timeout" = 5000;
      layer = "overlay";
      sort = "-time";
      
      # Global settings (like history) go here now too!
      "max-history" = 100;

      # To handle specific rules like urgency, we put them here
      "urgency=high" = {
        "default-timeout" = 0;
      };
    };
  };
}
