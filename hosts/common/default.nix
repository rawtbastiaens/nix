{ config, pkgs, ... }:
{
  system.stateVersion = "24.11"; # Did you read the comment?

  imports = 
    [
      ./bluetooth.nix
      ./btrfs.nix
      ./docker.nix
      ./gpg.nix
      ./libvirtd.nix
      ./locale.nix
      ./networking.nix
      ./nix-settings.nix
      ./security.nix
      ./sops.nix
      ./ssh.nix
      ./users.nix
      ./vagrant.nix
      ./x11.nix
      ./zsh.nix
      ./k8s.nix
      ./rustdesk.nix
      ./buildtools.nix
    ];
  environment.systemPackages = with pkgs; [];
}
