{pkgs, ... }:
{
  services = {
    autorandr = {
      enable = true;
      hooks = {
        postswitch = {
          "reload-qtile" = "qtile cmd-obj -o cmd -f reload_config";
        };
      };
    };
    udev = {
      packages = with pkgs; [
        autorandr
      ];
      extraRules =
        "SUBSYSTEM==\"drm\", ACTION==\"change\", ATTR{status}==\"connected\",  ENV{DISPLAY}=\":0\", ENV{XAUTHORITY}=\"/home/rba/.Xauthority\",RUN+=\"${pkgs.autorandr}/bin/autorandr --change \"";
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
}
