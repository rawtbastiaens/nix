{
  pkgs,
  lib,
  ...
}: {
  programs = {
    ghostty = {
      enable = true;
      settings = {
        font-size = 12;
        font-family = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}
