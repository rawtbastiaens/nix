{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common
      ../optional/languages.nix
      ../optional/barracuda.nix
      ../optional/monitoring.nix
      ../optional/noisetorch.nix
      # ../optional/qtile.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bulbasaur"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;
  networking.hosts = {
    "127.0.0.1" = ["prom.local" "grafana.local"];
  };

  environment.systemPackages = with pkgs; [
    inetutils
    vim
    wget
    gcc
    xorg.xev
    noto-fonts
    font-awesome_6
    font-awesome_5
    font-awesome_4
    gnupg
    freerdp
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.steam.enable = true;

  programs.hyprland = {
    enable = true;
  };

  system.autoUpgrade = {
    enable = true;
  };
}
