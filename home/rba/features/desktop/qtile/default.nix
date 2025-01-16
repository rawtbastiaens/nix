
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
    ".config/qtile/scripts" = {
      source = ../../../../../dotfiles/qtile/scripts;
      recursive = true;
    };
    ".config/qtile/wallpapers" = {
      source = ../../../../../dotfiles/qtile/wallpapers;
      recursive = true;
    };
    ".config/qtile/config.py" = {
      source = ../../../../../dotfiles/qtile/config.py;
    };
    ".config/qtile/autostart.sh" = {
      source = ../../../../../dotfiles/qtile/autostart.sh;
    };
  };

  imports = [
    ./fonts.nix
  ];
}