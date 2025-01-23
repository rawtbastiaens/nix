{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    snapper
    timeshift
  ];
}
