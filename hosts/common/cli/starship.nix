{
  # https://starship.rs/
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      username = {
        disabled = false;
        show_always = true;
        style_user = "green bold";
      };
      character = {
        success_symbol = "[↳](bold green)";
        error_symbol = "[✗](bold red)";
      };
      directory = {
        read_only = "";
      };
    };
  };
}
