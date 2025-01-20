{pkgs, ...}: {
  home.packages = with pkgs; [
    docker
    entr
    ferdium
    gitkraken
    glow
    keepassxc
    newsboat
    nodejs_22
    python3
    go
    vscodium
    zsh-completions
    remmina
    input-leap
    markdownlint-cli
  ];
}
