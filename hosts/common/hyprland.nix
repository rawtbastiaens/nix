{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wofi
    hyprpaper
    hyprlock
  ];
  programs.waybar = {
    enable = true;
  };
}

