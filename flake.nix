# flake.nix
{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations = {
        asus-dx = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/asus-dx.nix ];
        };
        ty = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/ty.nix ];
        };
      };
    };
}
