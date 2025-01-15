
{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    ranger
    dunst
    rofi
    feh
    flameshot
    i3lock-fancy
    neofetch
    zellij
    tmux
    pcmanfm
    dmenu
  ];
  home.file = {
    ".config/qtile" = {
      source = ../../../../../dotfiles/qtile;
      recursive = true;
    };
  };

  imports = [
    ./fonts.nix
  ];
}