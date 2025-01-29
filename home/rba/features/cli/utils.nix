{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    ansible
    ansible-lint
    bc
    binutils
    brightnessctl
    btop
    ethtool
    file
    fzf
    htop
    iftop
    iotop
    jq
    lsof
    ltrace
    netcat-openbsd
    nmap
    p7zip
    pciutils
    ripgrep
    strace
    tree
    unzip
    usbutils
    virt-manager
    vsce
    which
    xz
    yq-go
    zip
  ];
}
