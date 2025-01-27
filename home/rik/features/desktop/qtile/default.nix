
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

  services = {
    picom = {
      enable = true;
        settings = {
          backend = "glx";
          vsync = true;
        };
    };
  };


  imports = [
    ./fonts.nix
  ];
}
