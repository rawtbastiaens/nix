{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    xclip
  ];
  home.file = {
    ".xprofile" = {
      source = ../../../../dotfiles/x11/xprofile;
    };
  };
}
