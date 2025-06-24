{pkgs, ...}: {
  home.packages = with pkgs; [
    grim # screenshotting
    slurp # selection for screenshotting
  ];
}
