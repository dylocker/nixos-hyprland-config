{ pkgs, inputs, ... }: # 1. These are the 'tools' this file needs

{
  # 2. Tell Nix to actually install the Quickshell software
  home.packages = [ 
    inputs.quickshell.packages.${pkgs.system}.default 
  ];

  # 3. Tell Home Manager to move your QML code to the right spot
  xdg.configFile."quickshell" = {
    source = ./.;        # "Take everything in THIS folder..."
    recursive = true;    # "...including subfolders..."
    executable = true;   # "...and make sure they can run."
  };
}
