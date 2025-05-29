{
	description = "NixOs system with flakes and home Manager";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

		home-manager = {
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
		};
		};

	outputs = {self,nixpkgs,home-manager, ... }: let
	system = "x86_64-linux";
	in {
		nixosConfigurations."dragon" = nixpkgs.lib.nixosSystem {
		inherit system;
		modules = [
		./hosts/dragon/configuration.nix
		home-manager.nixosModules.home-manager
		{home-manager.users.drew = import ./home/drew/home.nix;
		}
		];
	};
	};
}

