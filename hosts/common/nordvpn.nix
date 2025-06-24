{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nordvpn
  ];
}
