{
  description = "Rik's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

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
        # modules = [./hosts/bulbasaur];
        modules = [./nixos/configuration.nix];
        specialArgs = {
          inherit inputs outputs;
        };
      };
    };

    homeConfigurations = {
      "rba@bulbasaur" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home-manager/home.nix ./home/rba/bulbasaur.nix];
      };
    };
  };
}
