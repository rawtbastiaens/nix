{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./hypr-monitor-switch.nix { }
