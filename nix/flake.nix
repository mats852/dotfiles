{
  description = "Multi-environment NixOS and Nix configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = {
        nixosGraphical = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          modules = [
            ./system/nixos-graphical.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };

      homeConfigurations = {
        graphical = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home/graphical.nix
          ];
        };
      };
    };
}

