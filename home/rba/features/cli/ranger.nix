{
  programs = {
    ranger = {
      enable = true;
    };
  };
  home.file.".config/ranger" = {
    source = ../../../../dotfiles/ranger;
    recursive = true;
  };
}
