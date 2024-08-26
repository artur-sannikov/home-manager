{ pkgs, ... }:

{
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.username = "artur";
  home.homeDirectory = "/home/artur";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nixfmt-rfc-style
    sox
    beets
    mat2
    ansible
    ansible-lint
    mediainfo
  ];
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  imports = [ ./common/home.nix ];

  # Let Home Manager install and manage itself.
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
        "ch.protonmail.protonmail-bridge"
        "com.brave.Browser"
        "com.calibre_ebook.calibre"
        "com.github.tchx84.Flatseal"
        "com.protonvpn.www"
        "eu.betterbird.Betterbird"
        "io.freetubeapp.FreeTube"
        "it.mijorus.gearlever"
        "md.obsidian.Obsidian"
        "org.audacityteam.Audacity"
        "org.qbittorrent.qBittorrent"
        "org.kde.okular"
        "org.onlyoffice.desktopeditors"
        "org.signal.Signal"
        "org.strawberrymusicplayer.strawberry"
        "org.torproject.torbrowser-launcher"
        "org.videolan.VLC"
        "org.zotero.Zotero"
        {
          appId = "us.zoom.Zoom";
          origin = "flathub";
          commit = "b9505f108b5f9acb2bbad83ac66f97b42bc6a75b9c28ed7b75dec1040e013305";
        } # Screen sharing is broken on Plasma on newer versions
      ];
    };
  };
}
