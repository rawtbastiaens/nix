{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    snapper
    timeshift
    btdu
    parted
    gparted
    pv
  ];
}
