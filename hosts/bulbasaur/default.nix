# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common
      ../optional/languages.nix
      ../optional/monitoring.nix
      ../optional/noisetorch.nix
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

  services = {
    # displayManager = {
    #   sddm = {
    #     enable = true;
    #     theme = "catppuccin-macchiato";
    #     package = pkgs.kdePackages.sddm;
    #   };
    # };
    xserver = {
      windowManager = {
        qtile = {
          enable = true;
        };
      };
      desktopManager.plasma5.enable = true;
    };
    xrdp.enable = true;
    xrdp.defaultWindowManager = "qtile start";
    xrdp.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = "12";
    })
    inetutils
    vim
    wget
    gcc
    xorg.xev
    noto-fonts
    font-awesome
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services = {
    udev = {
      packages = with pkgs; [
        autorandr
      ];
    };
  };
}
