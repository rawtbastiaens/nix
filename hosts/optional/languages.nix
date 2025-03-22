{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    powershell
    go
  ];
}
