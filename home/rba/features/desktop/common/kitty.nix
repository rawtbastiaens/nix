{
  pkgs,
  lib,
  ...
}: {
  programs = {
    kitty = {
      enable = true;
      extraConfig = ''
        enable_audio_bell no
        font_family Anonymous Pro
        font_size 12.0
      '';
    };
  };
}