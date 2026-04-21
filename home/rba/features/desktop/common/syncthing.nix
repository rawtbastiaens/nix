{ config, ... }:
{
  services = {
    syncthing = {
      enable = true;
      tray = {
        enable = false;
      };
    };
  };
}
