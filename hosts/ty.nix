{ config, pkgs, ... }:

{
  home.username = "artur";
  home.homeDirectory = "/home/artur";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    mat2
    devbox
    gnumake
    quarto
    nixfmt-rfc-style
    qt6.qtwayland
    kdePackages.kate
  ];

  # Import modules
  imports = [ ./common/home.nix ];

  # Set environment variables
  home.sessionVariables = {
    EDITOR = "nano";
    LC_TIME = "fi_FI.utf8";
  };

  # Let Home Manager install and manage itself
  programs = {
    home-manager = {
      enable = true;
    };
  };
  # Flatpak
  services = {
    flatpak = {
      enable = true;
      update.onActivation = true;
      packages = [
        "org.videolan.VLC"
        "org.zotero.Zotero"
        "org.kde.okular"
        "org.inkscape.Inkscape"
        "org.libreoffice.LibreOffice"
        {
          appId = "us.zoom.Zoom";
          origin = "flathub";
          commit = "b9505f108b5f9acb2bbad83ac66f97b42bc6a75b9c28ed7b75dec1040e013305";
        } # Screen sharing is broken on Plasma on newer versions
      ];
    };
  };
}
