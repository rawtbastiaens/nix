{
  xdg = {
    desktopEntries = {
      # Neovim desktop file
      neovim = {
        name = "Neovim";
        genericName = "Text editor";
        exec = "nvim %U";
        terminal = true;
        categories = [
          "Network"
          "WebBrowser"
        ];
      };
      tennet = {
        name = "TenneT AVD";
        exec = "xfreerdp ./Desktop/tennet.rdpw /u:Rik.Bastiaens@tennet.eu /gateway:type:arm /sec:aad /cert:ignore /gfx:rfx /drive:Client,/home/rba/tennet_avd /clipboard";
        terminal = true;
        categories = [
          "Network"
          "RemoteAccess"
        ];
        icon = "remmina";
        path = "$HOME";
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
        "text/xml" = [ "firefox.desktop" ];
        "application/pdf" = [ "zathura" ];
        "application/yaml" = [ "Neovim.desktop" ];
        "application/json" = [ "Neovim.desktop" ];
        "text/markdown" = [ "Neovim.desktop" ];
        "image/png" = [ "feh" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/discord" = [ "vesktop.desktop" ];
        "x-scheme-handler/msteams" = [ "teams-for-linux.desktop" ];
      };
    };
  };
}
