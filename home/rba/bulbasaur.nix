{
  pkgs,
  ...
}: {
  home.username = "rba";
  home.homeDirectory = "/home/rba";
  home.stateVersion = "24.11";
  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_SIZE = "16";
  };
  imports = [
    ./features/desktop/common
    ./features/desktop/qtile
    ./features/cli
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
