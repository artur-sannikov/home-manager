{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    ansible
    ansible-lint
  ];
}
