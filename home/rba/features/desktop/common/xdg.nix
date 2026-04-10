{
  xdg = {
    desktopEntries = {
      # Neovim desktop file
      neovim = {
        name = "Neovim";
        genericName = "Text editor";
        exec = "nvim %U";
        terminal = true;
        categories = [ "Network" "WebBrowser" ];
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = ["firefox.desktop"];
        "text/xml" = ["firefox.desktop"];
        "application/pdf" = ["zathura"];
        "application/yaml" = ["Neovim.desktop"];
        "application/json" = ["Neovim.desktop"];
        "text/markdown" = ["Neovim.desktop"];
        "image/png" = ["feh"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/discord" = ["vesktop.desktop"];
        "x-scheme-handler/msteams" = ["teams-for-linux.desktop"];
      };
    };
  };
}
