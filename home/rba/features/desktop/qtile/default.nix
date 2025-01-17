
{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    ranger
    dunst
    feh
    flameshot
    i3lock-fancy
    neofetch
    zellij
    tmux
    pcmanfm
    dmenu
  ];

  programs.rofi = {
    enable = true;
    font = "Noto Sans 12";
    terminal = "\${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun,run,window,ssh";
    };
    theme = "Arc-Dark";
  };

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
