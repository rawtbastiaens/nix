{pkgs, ...}: {
  home.packages = with pkgs; [
    anonymousPro
    # fira-code-nerdfont
    nerd-fonts.fira-code
  ];
}
