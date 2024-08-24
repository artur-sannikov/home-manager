{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [ jnoortheen.nix-ide ];
    userSettings = {
      # Font settings
      "editor.fontFamily" = "'Iosevka Fixed Extended', monospace";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      # nix configuration
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixfmt" ];
          };
        };
      };
      # Disable RedHat telemetry
      "redhat.telemetry.enabled" = false;
      # Remove traling whitespace on save
      "files.trimTrailingWhitespace" = true;
    };
  };
}
