{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./kitty.nix
    ./pavucontrol.nix
    ./discord.nix
    ./vscodium.nix
  ];
}