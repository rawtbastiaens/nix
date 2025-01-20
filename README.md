# NixOS config

```sh
.
├── flake.lock
├── flake.nix
├── home-manager
│   └── home.nix
└── nixos
    ├── configuration.nix
    └── hardware-configuration.nix

3 directories, 5 files
```

## Snippets

```sh
# View Firefox addons
nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"

# Build nixos
sudo nixos-rebuild switch --flake .#`hostname`

# Build home-manager
home-manager switch --flake .#`id -u -n`@`hostname`
```
