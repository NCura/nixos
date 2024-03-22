{
  description = "NC's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-23_11.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    #    hyprpaper = {
    #      url = "github:hyprwm/hyprpaper";
    #      inputs.nixpkgs.follows = "nixpkgs";
    #    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-23_11,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-23_11 = nixpkgs-23_11.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./hosts/default/configuration.nix
        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            extraSpecialArgs = {
              inherit inputs;
            };
            users = {
              "nicolas" = import ./hosts/default/home.nix;
            };
            useGlobalPkgs = true;
          };
        }
        (
          {pkgs, ...}: {
            nixpkgs.overlays = [(self: super: {wireplumber = pkgs-23_11.wireplumber;})];
          }
        )
      ];
    };
  };
}
