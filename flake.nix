{
  description = "Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: { 
    nixosConfigurations = {
      # This is your Laptop
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };

      # PREVIEW: This is how easy your Desktop will be later
      # nixos-desktop = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   modules = [ ./hosts/desktop/configuration.nix ];
      # };
    };
  };
}
