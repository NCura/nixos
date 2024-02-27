# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  system.stateVersion = "23.11";
  
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/aliases.nix
    ./../../modules/nixos/bluetooth.nix
    ./../../modules/nixos/internationalisation.nix
    ./../../modules/nixos/main-user.nix
    ./../../modules/nixos/openrgb.nix
    ./../../modules/nixos/session-variables.nix
    ./../../modules/nixos/steam.nix
    ./../../modules/nixos/system-packages.nix
    ./../../modules/nixos/virtualization.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "kvm-amd" ];
  services.xserver.videoDrivers = ["amdgpu"];

  security.sudo.wheelNeedsPassword = false;

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
#        substituters = ["https://hyprland.cachix.org"];
#        trusted-public-keys = [
#          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
#        ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "nicolas" = import ./home.nix; };
    useGlobalPkgs = true;
  };

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
}
