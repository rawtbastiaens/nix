{pkgs, ...}: {
  home.packages = with pkgs; [
    arandr
  ];

  programs = {
    autorandr = {
      enable = true;
    };
  };

  #    ignoreLid = true;
  #    profiles = {
  #      "dual_home" = {
  #        config = {
  #          HDMI-1 = {
  #            enable = true;
  #            primary = false;
  #            position = "3440x0";
  #            mode = "1920x1080";
  #            rate = "60.00";
  #          };
  #          eDP-1 = {
  #            enable = true;
  #            primary = true;
  #            position = "0x0";
  #            mode = "3440x1440";
  #          };
  #        };
  #      };
  #    };
  #  };
  #};

  # run autorandr --change on xsession init
  xsession.initExtra = "${pkgs.autorandr}/bin/autorandr --change";
}
