# flake.nix
{
  description = "NixOS system with flakes and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.dragon = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/dragon/configuration.nix
          home-manager.nixosModules.home-manager

          {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.drew = import ./home/drew/home.nix {
              inherit pkgs;
              config = {};
              inputs = {
                inherit self;
              };
            };
          }
        ];
      };
    };
}

