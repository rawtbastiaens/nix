{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cliphist
    wlogout
    grim
    hyprlock
    hyprpaper
    hyprpicker
    hyprprop
    hyprshot
    rofi
    slurp
    swappy
    wl-clipboard
    wofi
  ];
  programs.waybar = {
    enable = true;
  };
}

