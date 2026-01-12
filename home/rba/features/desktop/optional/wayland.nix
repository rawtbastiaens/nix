{pkgs, ...}: {
  home.packages = with pkgs; [
    grim # screenshotting
    slurp # selection for screenshotting
    bibata-cursors
    material-cursors
    wl-clipboard
    swaync
  ];
}
