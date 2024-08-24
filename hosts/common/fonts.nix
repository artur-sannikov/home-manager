{ config, pkgs, ... }:
{
  fonts.fontDir.enable = true;
  home.packages = with pkgs; [
    pkgs.iosevka
];
}
