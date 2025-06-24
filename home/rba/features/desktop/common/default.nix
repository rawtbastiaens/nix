{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./browsers.nix
    ./discord.nix
    ./games.nix
    ./gtk.nix
    ./kitty.nix
    ./libreoffice.nix
    ./network.nix
    ./noisetorch.nix
    ./obsidian.nix
    ./pavucontrol.nix
    ./productivity.nix
    ./randr.nix
    ./screenkey.nix
    ./spotify.nix
    ./syncthing.nix
    ./vlc.nix
    ./vscodium.nix
    ./wayland.nix
  ];

  xdg.portal = {
    config.common.default = "*";
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

}

