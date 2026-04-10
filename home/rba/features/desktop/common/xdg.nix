{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = ["firefox.desktop"];
      "text/xml" = ["firefox.desktop"];
      "application/pdf" = ["zathura"];
      "application/yaml" = ["nvim"];
      "application/json" = ["nvim"];
      "text/markdown" = ["nvim"];
      "image/png" = ["feh"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/discord" = ["vesktop.desktop"];
      "x-scheme-handler/msteams" = ["teams-for-linux.desktop"];
    };
  };
}
