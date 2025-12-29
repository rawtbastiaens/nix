{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wofi
    hyprpaper
    hyprshot
    hyprlock
    grim
    slurp
    swappy
    wl-clipboard
    cliphist
    rofi
    hyprpicker
  ];
  programs.waybar = {
    enable = true;
  };
}

