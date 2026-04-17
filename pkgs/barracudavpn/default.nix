{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage ./barracudavpn.nix { }
