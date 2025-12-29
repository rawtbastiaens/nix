{ config, pkgs, ... }:
{
  system.stateVersion = "25.05"; # Did you read the comment?

  imports = 
    [
      ./audio.nix
      ./bluetooth.nix
      ./btrfs.nix
      ./buildtools.nix
      ./docker.nix
      ./gpg.nix
      ./hyprland.nix
      ./fonts.nix
      ./k8s.nix
      ./latex.nix
      ./libvirtd.nix
      ./locale.nix
      ./networking.nix
      ./nix-settings.nix
      ./nix-tools.nix
      ./rustdesk.nix
      ./security.nix
      ./sops.nix
      ./ssh.nix
      ./users.nix
      ./vagrant.nix
      ./x11.nix
      ./zsh.nix
    ];
  environment.systemPackages = with pkgs; [
  ];
}
