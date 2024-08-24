# flake.nix
{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Declarative Nix Flatpaks
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations = {
        asus-dx = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/asus-dx.nix
            nix-flatpak.homeManagerModules.nix-flatpak
          ];
        };
        ty = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/ty.nix
            nix-flatpak.homeManagerModules.nix-flatpak
          ];
        };
      };
    };
}
