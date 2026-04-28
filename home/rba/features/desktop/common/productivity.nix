{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #docker
    entr
    ferdium
    gitkraken
    glow
    input-leap
    keepassxc
    keepassxccli
    newsboat
    remmina
    zsh-completions
  ];
}
