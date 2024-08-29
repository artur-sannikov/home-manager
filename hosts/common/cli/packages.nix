{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ansible
    ansible-lint
    cachix
    nixd
    screen
  ];
}
