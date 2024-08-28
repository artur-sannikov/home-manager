{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
      ms-python.python
      quarto.quarto
      redhat.ansible
      redhat.vscode-yaml
      reditorsupport.r
    ];
    userSettings = {
      # Font settings
      "editor.fontFamily" = "'Iosevka Fixed Extended', monospace";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;
      # Enable smooth scrolling
      "editor.smoothScrolling" = true;
      # Format on save
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
      "files.associations" = {
        "*.hujson" = "jsonc";
        "*.bu" = "yaml";
        "main.yml" = "ansible";
      };
      # Disable RedHat telemetry
      "redhat.telemetry.enabled" = false;
      # Remove traling whitespace on save
      "files.trimTrailingWhitespace" = true;
    };
  };
}
