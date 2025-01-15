{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh.nix
    ./nvim.nix
    ./utils.nix
  ];
}