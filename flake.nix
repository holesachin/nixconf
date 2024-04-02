{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";   #  unstable
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let 
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    # system
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./system/configuration.nix ];
        specialArgs = {
          inherit pkgs-unstable;   #  unstable
        };
      };
    };

    # home-manager
    homeConfigurations = {
        home-manager.useGLobarPks = true;
       sachin = home-manager.lib.homeManagerConfiguration {
         inherit pkgs;
         modules = [ ./user/home.nix ];
         extraSpecialArgs = {
            inherit pkgs-unstable;  #  unstable
         };
      };
    };
  };
}
