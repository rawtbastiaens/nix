{
  pkgs,
  lib,
  ...
}: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        bindkey -s "^o" "ranger\n"
      '';

      shellAliases = {
        nx-build = "sudo nixos-rebuild switch --flake .#bulbasaur";
        hm-build = "home-manager switch --flake .#rba@bulbasaur";
        flake-edit = "$EDITOR ~/nixos-config/flake.nix";
        nx-edit = "$EDITOR ~/nixos-config/nixos/configuration.nix";
        hm-edit = "$EDITOR ~/nixos-config/home-manager/home.nix";
        qtc = "nvim ~/.config/qtile/config.py";
        code = "codium";
        g = "git";
      };
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "systemd" "rsync" "kubectl" ];
        theme = "robbyrussell";
      };
    };
  };
}
