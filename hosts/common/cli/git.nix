{
  programs = {
    git = {
      enable = true;
      userName = "Artur Sannikov";
      userEmail = "40318410+artur-sannikov@users.noreply.github.com";
      extraConfig = {
        url = {
          "git@github.com:" = {
            insteadOf = "https://github.com/";
          };
        };
        user.signingKey = "/home/artur/.ssh/git-sign.pub";
        commit.gpgsign = "true";
        gpg.format = "ssh";
      };
    };
  };
}
