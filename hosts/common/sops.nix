{ pkgs, inputs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    sops
  ];
}
