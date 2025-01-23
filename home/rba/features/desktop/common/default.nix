{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./kitty.nix
    ./pavucontrol.nix
    ./discord.nix
    ./spotify.nix
    ./vscodium.nix
    ./randr.nix
    ./productivity.nix
    ./screenkey.nix
    ./firefox.nix
    ./gtk.nix
    ./syncthing.nix
    ./obsidian.nix
    ./vlc.nix
    ./noisetorch.nix
  ];

  xdg.portal.enable = true;
}

