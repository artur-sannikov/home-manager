{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ansible
    ansible-lint
    nixd
    screen
  ];
}
