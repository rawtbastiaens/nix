{
  pkgs,
  ...
}: {
  imports = [
    ./browsers.nix
    ./xdg.nix
    # ./discord.nix
    # ./games.nix
    ./gtk.nix
    ./kitty.nix
    ./ghostty.nix
    ./libreoffice.nix
    ./network.nix
    # ./noisetorch.nix
    # ./obsidian.nix
    ./pavucontrol.nix
    ./productivity.nix
    ./randr.nix
    # ./screenkey.nix
    ./notify.nix
    ./spotify.nix
    ./teams.nix
    ./syncthing.nix
    ./vlc.nix
    ./vscodium.nix
    ./fonts.nix
    # ./wayland.nix
  ];

  xdg.portal = {
    config.common.default = "*";
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

}

