{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.kde5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  services = {
    xrdp = {
      enable = true;
      openFirewall = true;
    };
  };
}
