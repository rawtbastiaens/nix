{ config, pkgs, ... }:
{
  home.file = {
    ".config/test" = {
      text = ''
        hello
      '';
      executable = false;
    };
  };
}