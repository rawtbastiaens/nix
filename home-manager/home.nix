{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rba";
  home.homeDirectory = "/home/rba";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    arandr
    binutils
    btop
    dmenu
    docker
    dunst
    entr
    ethtool
    feh
    ferdium
    file
    firefox
    flameshot
    fzf
    gimp
    gitkraken
    glow
    htop
    i3lock-fancy
    iftop
    iotop
    jq
    keepassxc
    lsof
    ltrace
    neofetch
    newsboat
    p7zip
    pavucontrol
    pciutils
    ranger
    ripgrep
    rofi
    strace
    syncthing
    tree
    unzip
    usbutils
    vscodium
    which
    xz
    yq-go
    zellij
    zip
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file = {
  #  "nvim" = {
  #    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/nvim";
  #    recursive = true;
  #  };
  #};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rba/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  programs = {
    alacritty = {
      enable = true;
    };
    neovim = {
      enable = true;
      extraConfig = ''
      	set number relativenumber
        set tabstop=2 softtabstop=2 shiftwidth=2
        set expandtab
        syntax enable
      '';
    };
    git = {
      enable = true;
      userName = "Rik Bastiaens";
      userEmail = "rbastiaens@ilionx.com";
      aliases = {
        s = "status";
        cv = "commit -v";
        cm = "commit -m";
        ps = "push";
        pl = "pull";
        f = "fetch";
      };
    };
    zsh = {
      enable = true;
      enableCompletion = false;

      # Disable DPMS (screen auto turn-off)
      loginExtra = "xset -dpms";
      shellAliases = {
        nx-build = "sudo nixos-rebuild switch --flake .#bulbasaur";
        hm-build = "home-manager switch --flake .#rba@bulbasaur";
        flake-edit = "$EDITOR ~/nixos-config/flake.nix";
        nx-edit = "$EDITOR ~/nixos-config/nixos/configuration.nix";
        hm-edit = "$EDITOR ~/nixos-config/home-manager/home.nix";
        qtc = "nvim ~/.config/qtile/config.py";
        g = "git";
      };
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "systemd" "rsync" "kubectl" ];
        theme = "robbyrussell";
      };
    };
  };

  services.picom.enable = true;
  services.autorandr = {
  	enable = true;
  };
  xsession.initExtra = "${pkgs.autorandr}/bin/autorandr --change";

  #environment.etc = {
  #  "xdg/gtk-3.0/settings.ini".text = ''
  #    [Settings]
  #    gtk-application-prefer-dark-theme=1
  #  '';
  #};

  dconf.settings = {
    
  };

  gtk.enable = true;
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme=1;
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # All options for home-manager:
  # https://home-manager-options.extranix.com/?query=zsh&release=master
}
