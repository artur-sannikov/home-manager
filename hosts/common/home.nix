{ config, ... }:
{
  imports = [
    ./virtualization.nix
    ./cli/packages.nix
    ./cli/git.nix
    ./cli/zsh.nix
    ./cli/starship.nix
    ./cli/R.nix
    ./gui/vscodium.nix
  ];
}
