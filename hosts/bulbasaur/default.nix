{ pkgs, ... }:

{

  nixpkgs.overlays = [
    (import ~/.config/nixpkgs/overlays/barracudavpn.nix)
  ];
  imports = [
    ./hardware-configuration.nix
    ../common
    ../optional/languages.nix
    ../optional/monitoring.nix
    ../optional/noisetorch.nix
    # ../optional/barracuda.nix
    #../optional/xrdp.nix
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
    "127.0.0.1" = [
      "prom.local"
      "grafana.local"
    ];
    "62.140.138.32" = [
      "nlvir1ngh01rm1"
      "rm1"
    ];
    "62.140.138.33" = [
      "nlehv1ngh01-rm02"
      "rm2"
    ];
  };

  environment.systemPackages = with pkgs; [
    barracudavpn
    kdePackages.kwallet-pam
    inetutils
    teams-for-linux
    bat
    vim
    wget
    librewolf
    logseq
    gcc
    xorg.xev
    noto-fonts
    font-awesome_6
    font-awesome_5
    font-awesome_4
    gnupg
    freerdp
  ];

  services.udisks2.enable = true;

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
