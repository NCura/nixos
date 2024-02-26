{
  description = "NC's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
   let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
   in
   {

     nixosConfigurations.default = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit inputs; };
       modules = [
         ./hosts/default/configuration.nix
	     inputs.home-manager.nixosModules.default
       ];
     };

   };
}
