{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      initContent = ''
        bindkey -s "^o" "ranger\n"
        autoload bashcompinit && bashcompinit
        autoload -Uz compinit && compinit
        complete -C '$(which aws_completer)' aws
      '';

      shellAliases = {
        nx-build = "sudo nixos-rebuild switch --flake .#`hostname`";
        hm-build = "home-manager switch --flake .#`id -u -n`@`hostname`";
        flake-edit = "$EDITOR ~/nixos-config/flake.nix";
        nx-edit = "$EDITOR ~/nixos-config/nixos/configuration.nix";
        hm-edit = "$EDITOR ~/nixos-config/home-manager/home.nix";
        qtc = "nvim ~/.config/qtile/config.py";
        code = "codium";
        g = "git";
        kx = "kubectx";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "systemd"
          "rsync"
          "kubectl"
          "aws"
          "alias-finder"
          "virtualenv"
          "fzf"
          "sudo"
          "docker"
          "docker-compose"
          "colored-man-pages"
        ];
        theme = "agnoster";
      };
    };
  };
}
