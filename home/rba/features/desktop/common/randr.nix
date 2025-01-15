{pkgs, ...}: {
  home.packages = with pkgs; [
    arandr
    xrandr
    autorandr
  ];

  services = {
    autorandr = {
      enable = true;
    };
  };

  # run autorandr --change on xsession init
  xsession.initExtra = "${pkgs.autorandr}/bin/autorandr --change";
}