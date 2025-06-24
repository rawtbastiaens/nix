{pkgs, ...}: {
  home.packages = with pkgs; [
    #docker
    entr
    ferdium
    gitkraken
    glow
    input-leap
    keepassxc
    newsboat
    remmina
    zsh-completions
  ];
}
