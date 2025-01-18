{pkgs, ...}: {
  home.packages = with pkgs; [
    gollum
  ];
}
