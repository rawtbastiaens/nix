{ config, pkgs, ... }:
{
  home.file = {
    ".xprofile" = {
      source = ../../../../dotfiles/x11/xprofile;
    };
  };
}
