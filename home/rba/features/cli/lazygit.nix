{ config, pkgs, ... }:
{
  programs = {
    lazygit = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        gui = {
          # Enable nerd fonts for icon support
          nerdFontsVersion = "3";
        };
        git.pagers = [
          {
            # Set up delta as diff tool
            pager = "delta --dark --paging=never";
          }
        ];
      };
    };
  };
}
