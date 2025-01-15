{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh.nix
  ];
}