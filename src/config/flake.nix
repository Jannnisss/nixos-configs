{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  {
    nixosConfigurations = {
      gamingpc = nixpkgs.lib.nixosSystem{
        specialArgs = {inherit inputs;};
        modules = [
          ./home-manager/hosts/gamingpc/home.nix
          ./hosts/gamingpc/configuration.nix
        ];
      };
    };
  };
}