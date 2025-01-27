{ config, pkgs, ... }:
{
  programs = {
    lazygit = {
      enable = true;
      settings = {
        gui = {
          nerdFontsVersion = "3";
        };
        git = {
          allBranchesLogCmd = "git log --graph --pretty=format:'%C(auto)%h%Creset%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset";
        };
      };
    };
  };
}
