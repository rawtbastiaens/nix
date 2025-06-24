{
  pkgs,
  ...
}: {
  home.username = "rba";
  home.homeDirectory = "/home/rba";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_SIZE = "16";
  };
  imports = [
    ./features/desktop/common
    ./features/cli
  ];

  home.file = {
  };
}
