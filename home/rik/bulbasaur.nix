{
  pkgs,
  ...
}: {
  home.username = "rba";
  home.homeDirectory = "/home/rba";
  home.stateVersion = "24.11";
  imports = [
    ./features/desktop/common
    ./features/desktop/qtile
    ./features/cli
  ];
}
