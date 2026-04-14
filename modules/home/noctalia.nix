{ lib, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = lib.mkForce (builtins.fromJSON (builtins.readFile ./noctalia.json));
  };
}
