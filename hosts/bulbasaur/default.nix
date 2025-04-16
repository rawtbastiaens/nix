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
    displayManager = {
      autoLogin = {
        enable = true;
        user = "rba";
      };
      sddm = {
        enable = true;
        theme = "catppuccin-macchiato";
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
  programs.steam.enable = true;

  system.autoUpgrade = {
    enable = true;
  };

  services = {
    autorandr = {
      enable = true;
      hooks = {
        postswitch = {
          "reload-qtile" = "qtile cmd-obj -o cmd -f reload_config";
        };
      };
    };
  };

  services = {
    udev = {
      packages = with pkgs; [
        autorandr
      ];
      extraRules =
           "SUBSYSTEM==\"drm\", ACTION==\"change\", ATTR{status}==\"connected\",  ENV{DISPLAY}=\":0\", ENV{XAUTHORITY}=\"/home/rba/.Xauthority\",RUN+=\"${pkgs.autorandr}/bin/autorandr --change \"";
    };
  };
}
