{pkgs, ...}: {
  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
      gtk-cursor-theme-name="breeze_cursors";
      gtk-cursor-theme-size=16;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
      gtk-cursor-theme-name="breeze_cursors";
      gtk-cursor-theme-size=16;
    };
  };
}
