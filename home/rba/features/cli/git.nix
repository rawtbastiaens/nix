{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Rik Bastiaens";
          email = "rik.bastiaens@vodafoneziggo.com";
          signingKey = "F34360DF564E368D";
        };
        commit = {
          gpgsign = true;
        };
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
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
  home.packages = with pkgs; [
    meld
  ];
}
