{ config, pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "xterm-256color";
  };
}
