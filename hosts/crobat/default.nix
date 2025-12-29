{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common
      ../optional/languages.nix
      ../optional/monitoring.nix
      ../optional/noisetorch.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "crobat"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  services = {
    displayManager = {
      sddm = {
        enable = true;
        # theme = "catppuccin-macchiato";
        package = pkgs.kdePackages.sddm;
      };
    };
    xserver = {
      windowManager = {
        qtile = {
          enable = true;
        };
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # (catppuccin-sddm.override {
    #   flavor = "macchiato";
    #   font = "Noto Sans";
    #   fontSize = "12";
    # })
    inetutils
    jdk8
    jre8
    read-edid
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

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
