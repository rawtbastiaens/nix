{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./git.nix
    ./x11.nix
    ./zsh.nix
    ./nvim.nix
    ./utils.nix
    ./home-manager.nix
    ./env.nix
  ];
}
