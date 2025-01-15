
{
  pkgs,
  lib,
  ...
}: {
  home.file = {
    ".config/qtile" = {
      source = ../../../../../dotfiles/qtile;
      recursive = true;
    };
  };
}