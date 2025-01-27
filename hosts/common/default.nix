{ config, pkgs, ... }:
{
  time.timeZone = "Europe/Amsterdam";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "nl_NL.UTF-8";
      LC_IDENTIFICATION = "nl_NL.UTF-8";
      LC_MEASUREMENT = "nl_NL.UTF-8";
      LC_MONETARY = "nl_NL.UTF-8";
      LC_NAME = "nl_NL.UTF-8";
      LC_NUMERIC = "nl_NL.UTF-8";
      LC_PAPER = "nl_NL.UTF-8";
      LC_TELEPHONE = "nl_NL.UTF-8";
      LC_TIME = "nl_NL.UTF-8";
    };
  };

  # Configure keymap in X11
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    openssh = {
      enable = true;
    };
  };

  users.users = {
    rba = {
      isNormalUser = true;
      description = "Rik Bastiaens";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
      shell = pkgs.zsh;
      packages = with pkgs; [];
    };
    rik = {
      isNormalUser = true;
      description = "Rik Bastiaens";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ];
      shell = pkgs.zsh;
      packages = with pkgs; [];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [];


  networking.firewall.enable = false;

  system.stateVersion = "24.11"; # Did you read the comment?

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    zsh = {
      enable = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;
}
