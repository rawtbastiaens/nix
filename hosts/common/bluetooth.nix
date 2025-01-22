{ config, pkgs, ... }:
{
  services ={
    blueman = {
      enable = true;
    };
  };
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
          ControllerMode = "dual";
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
