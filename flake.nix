{
  description = "Rik's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    sops-nix.url = "github:Mic92/sops-nix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      # Work laptop
      bulbasaur = nixpkgs.lib.nixosSystem {
        modules = [./hosts/bulbasaur];
        specialArgs = {
          inherit inputs outputs;
        };
      };
      # Private laptop
      crobat = nixpkgs.lib.nixosSystem {
        modules = [./hosts/crobat];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };

    homeConfigurations = {
      "rba@bulbasaur" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/rba/bulbasaur.nix];
      };
      "rik@bulbasaur" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/rik/bulbasaur.nix];
      };
      "rba@crobat" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/rba/crobat.nix];
      };
    };
  };
}
