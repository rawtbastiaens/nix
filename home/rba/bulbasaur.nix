{
  home.username = "rba";
  home.homeDirectory = "/home/rba";
  home.stateVersion = "25.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_SIZE = "16";
  };
  imports = [
    ./features/desktop/common
    ./features/desktop/qtile
    ./features/cli
    ./features/desktop/optional/coding.nix
    ./features/desktop/optional/zotero.nix
    #./features/desktop/optional/discord.nix
    ./features/desktop/optional/gaming.nix
    ./features/desktop/optional/librewolf.nix
    ./features/desktop/optional/noisetorch.nix
    ./features/desktop/optional/obsidian.nix
    ./features/desktop/optional/wayland.nix
    ./features/desktop/hypr
    ./features/desktop/optional/mail.nix
    ./features/desktop/optional/calibre.nix
  ];

  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1, 1920x1080, 0x0, 1"
    "desc:Samsung Electric Company LC34G55T HNBX800474, 3440x1440,1920x0,1"
    "desc:Dell Inc. DELL P3424WE D8F66T3, 3440x1440,0x-1440,1"
    "desc:LG Electronics LG ULTRAWIDE 0x00055CE1, 3440x1440, auto-center-left, 1"
    ", preferred, auto, 1"
  ];

  home.file = {
    ".config/qtile/scripts" = {
      source = ../../dotfiles/qtile/bulbasaur/scripts;
      recursive = true;
    };
    ".config/qtile/wallpapers" = {
      source = ../../dotfiles/qtile/bulbasaur/wallpapers;
      recursive = true;
    };
    ".config/qtile/config.py" = {
      source = ../../dotfiles/qtile/bulbasaur/config.py;
    };
    ".config/qtile/autostart.sh" = {
      source = ../../dotfiles/qtile/bulbasaur/autostart.sh;
    };
  };
}
