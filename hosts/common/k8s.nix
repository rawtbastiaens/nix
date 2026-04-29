{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kubectl
    kubectx
    kubernetes-helm
    k9s
  ];
}
