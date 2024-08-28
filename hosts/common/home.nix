{ config, ... }:
{
  imports = [
    ./virtualization.nix
    ./cli/packages.nix
    ./cli/git.nix
    ./cli/zsh.nix
    ./cli/starship.nix
    ./gui/vscodium.nix
  ];
}
