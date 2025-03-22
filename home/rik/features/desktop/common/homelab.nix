{pkgs, ...}: {
  home.packages = with pkgs; [
    apache-directory-studio
  ];
}
