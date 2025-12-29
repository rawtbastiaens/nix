{pkgs, ...}: {
  home.packages = with pkgs; [
    ansible-language-server
    go
    markdownlint-cli
    nodejs_22
    vscodium
    nil
  ];
}
