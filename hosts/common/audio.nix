{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    alsa-utils
    cava
    playerctl
  ];
}
