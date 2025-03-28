# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/6e5428e0-62af-4c30-9362-f5e369c59a57";
  #     fsType = "btrfs";
  #     options = [ "subvol=@" ];
  #   };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/555c2e3e-a7ef-4fe1-8a68-031b56c563bd";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  boot.initrd.luks.devices."luks-76085d89-6a37-4040-a60d-bf20a8dece7e".device = "/dev/disk/by-uuid/76085d89-6a37-4040-a60d-bf20a8dece7e";
  #boot.initrd.luks.devices."luks-1e3bfc58-18d2-49ee-8992-4018e2c7d64c".device = "/dev/disk/by-uuid/1e3bfc58-18d2-49ee-8992-4018e2c7d64c";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/17D0-2989";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp146s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
