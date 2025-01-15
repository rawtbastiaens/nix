{
  pkgs,
  ...
}: {
  imports = [
    ./features/desktop/common
    ./features/desktop/qtile
    ./features/cli
  ];
}
