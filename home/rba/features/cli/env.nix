{ config, pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "xterm-256color";
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };
}
