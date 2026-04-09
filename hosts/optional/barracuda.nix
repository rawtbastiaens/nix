{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    barracudavpn
  ];
}
