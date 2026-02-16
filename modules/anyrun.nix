{ pkgs, inputs, ... }:

{
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.dictionary
        inputs.anyrun.packages.${pkgs.system}.symbols
      ];
      x.fraction = 0.5;
      y.fraction = 0.3;
      width.fraction = 0.3;
      hideIcons = false;
      layer = "overlay";
      hideOnClick = true;
      showResultsImmediately = false;
      maxEntries = null;
    };

    extraCss = ''
      #window { background-color: rgba(0, 0, 0, 0); }
      box#main {
        background-color: #1e1e2e;
        border: 2px solid #89b4fa;
        border-radius: 12px;
        padding: 8px;
      }
    '';
  };
}
