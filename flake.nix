{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";   #  unstable
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }:
  let 
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
  in {
    # system
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./system/configuration.nix ];
        specialArgs = {
          inherit pkgs-stable;   #  stable
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
            inherit pkgs-stable;  #  stable
         };
      };
    };
  };
}
