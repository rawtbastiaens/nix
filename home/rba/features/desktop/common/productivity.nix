{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible-language-server
    docker
    entr
    ferdium
    gitkraken
    glow
    go
    input-leap
    keepassxc
    markdownlint-cli
    newsboat
    nodejs_22
    python3
    remmina
    vscodium
    zsh-completions
  ];
}
