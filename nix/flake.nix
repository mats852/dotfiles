{
  description = "Flake for managing dotfiles and configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-stable"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    homeConfigurations = {
      username = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux"; 
        homeDirectory = "/home/mats"; 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          ./home/home.nix
        ];
      };
    };
  };
}

