{ config, ... }:
{
  imports = [
    ./virtualization.nix
    ./cli/packages.nix
    ./cli/git.nix
    ./cli/zsh.nix
    ./cli/starship.nix
    ./cli/direnv.nix
    ./cli/R.nix
    ./cli/bash.nix
    ./gui/vscodium.nix
  ];
}
