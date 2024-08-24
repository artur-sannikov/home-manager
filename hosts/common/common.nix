{ config, pkgs, ... }:
{
  imports = [ 
    ./cli/git.nix
    ./cli/zsh.nix
    ];
}
