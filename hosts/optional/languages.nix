{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    powershell
    python313
    mariadb
    go
    openjdk17-bootstrap
  ];
}
