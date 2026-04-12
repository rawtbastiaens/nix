{pkgs, ...}: {
  programs = {
    git = {
      enable = true;
      settings = {
        user = { 
          name = "Rik Bastiaens";
          email = "rbastiaens@ilionx.com";
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
  };
  home.packages = with pkgs; [
    meld
  ];
}
