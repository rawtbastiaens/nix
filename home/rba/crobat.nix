{
  pkgs,
  ...
}: {
  home.username = "rba";
  home.homeDirectory = "/home/rba";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [
    ./features/desktop/common
    ./features/desktop/qtile
    ./features/cli
  ];

  home.file = {
    ".config/qtile/scripts" = {
      source = ../../dotfiles/qtile/crobat/scripts;
      recursive = true;
    };
    ".config/qtile/wallpapers" = {
      source = ../../dotfiles/qtile/crobat/wallpapers;
      recursive = true;
    };
    ".config/qtile/config.py" = {
      source = ../../dotfiles/qtile/crobat/config.py;
    };
    ".config/qtile/autostart.sh" = {
      source = ../../dotfiles/qtile/crobat/autostart.sh;
    };
  };
}
