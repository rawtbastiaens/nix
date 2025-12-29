{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    deadnix
    nix-diff
    nix-du
    nix-melt
    nil
  ];
}
