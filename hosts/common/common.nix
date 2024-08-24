{ config, pkgs, ... }:
{
  imports = [
    ./cli/git.nix
    ./cli/zsh.nix
    ./cli/starship.nix
  ];
}
