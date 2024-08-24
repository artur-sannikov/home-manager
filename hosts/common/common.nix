{ config, pkgs, ... }:
{
  imports = [
    ./fonts.nix
    ./cli/git.nix
    ./cli/zsh.nix
    ./cli/starship.nix
  ];
}
