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
        font_family Fira Code
        font_size 12.0
        disable_ligatures always
      '';
    };
  };
}
