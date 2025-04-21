{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  {
    nixosConfigurations = {
      mainpc = nixpkgs.lib.nixosSystem{
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/home-manager/hosts/mainpc/home.nix
          ./hosts/mainpc/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}