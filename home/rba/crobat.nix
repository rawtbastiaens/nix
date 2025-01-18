{
  pkgs,
  ...
}: {
  home.username = "rba";
  home.homeDirectory = "/home/rba";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [
    ./features/desktop/common
    ./features/desktop/qtile
    ./features/cli
  ];
}
