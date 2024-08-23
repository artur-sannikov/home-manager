{ config, pkgs, ... }:
{
  home.username = "artur";
  home.homeDirectory = "/home/artur";

  imports = [
    ./packages/git.nix
  ];
}
