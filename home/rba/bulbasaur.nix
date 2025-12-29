{
  pkgs,
  ...
}: {
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
    #./features/desktop/optional/discord.nix
    ./features/desktop/optional/gaming.nix
    ./features/desktop/optional/noisetorch.nix
    ./features/desktop/optional/obsidian.nix
    ./features/desktop/optional/wayland.nix
    ./features/desktop/optional/mail.nix
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
