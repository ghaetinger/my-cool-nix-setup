{
  programs.git = {
    enable = true;
    userName  = "Guilherme Gomes Haetinger";
    userEmail = "ghaetinger@gmail.com";
    ignores = ["*.nix" ".direnv" ".envrc"];
    extraConfig = {
       url."ssh://git@github.com".insteadOf = "https://github.com";
    };
  };
}
