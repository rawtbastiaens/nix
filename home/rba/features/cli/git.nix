{
  pkgs,
  lib,
  ...
}: {
  programs = {
    git = {
      enable = true;
      userName = "Rik Bastiaens";
      userEmail = "rbastiaens@ilionx.com";
      aliases = {
        s = "status";
        cv = "commit -v";
        cm = "commit -m";
        ps = "push";
        pl = "pull";
        f = "fetch";
      };
    };
  };
}
