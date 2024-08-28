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

    # VS Code extensions
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nix-flatpak,
      nix-vscode-extensions,
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
            {
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
              ];
            }
          ];
        };
        ty = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/ty.nix
            nix-flatpak.homeManagerModules.nix-flatpak
            {
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
              ];
            }
          ];
        };
      };
    };
}
