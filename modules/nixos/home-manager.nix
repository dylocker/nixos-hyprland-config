{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.daniellee = {
      imports = [ 
        ../../modules/home/home.nix
        inputs.nvf.homeManagerModules.default
        inputs.niri-flake.homeModules.niri
        inputs.noctalia.homeModules.default
      ];
    };
  };
}
