{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./brave.nix
    ./ghostty.nix
    ./pavucontrol.nix
    ./discord.nix
    ./spotify.nix
    ./vscodium.nix
    ./randr.nix
    ./games.nix
    ./productivity.nix
    ./screenkey.nix
    ./browsers.nix
    ./gtk.nix
    ./syncthing.nix
    ./obsidian.nix
    ./vlc.nix
    ./noisetorch.nix
    ./libreoffice.nix
    ./network.nix
  ];

  xdg.portal = {
    config.common.default = "*";
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

}

