{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./krew.nix { }
