{
  programs = {
    zsh = {
      enable = true;
      history = {
        path = "$HOME/.histfile";
        save = 10000;
        size = 10000;
      };
      oh-my-zsh = {
        enable = true;
        theme = "gnzh";
        plugins = [
          "git"
          "toolbox"
          "z"
          "podman"
        ];
      };
    };
  };
}
