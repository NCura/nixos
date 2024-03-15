# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/aliases.nix
    ./../../modules/nixos/audio.nix
    ./../../modules/nixos/bluetooth.nix
    ./../../modules/nixos/internationalisation.nix
    ./../../modules/nixos/main-user.nix
    # ./../../modules/nixos/openrgb.nix
    ./../../modules/nixos/printing.nix
    ./../../modules/nixos/session-variables.nix
    ./../../modules/nixos/steam.nix
    ./../../modules/nixos/system-packages.nix
    ./../../modules/nixos/virtualization.nix
    inputs.home-manager.nixosModules.default
  ];

  system.stateVersion = "23.11";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = ["kvm-amd"];
  services.xserver.videoDrivers = ["amdgpu"];

  # security.sudo.wheelNeedsPassword = false;

  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
    # To try to prevent "Network change detected" errors
    interfaces.eno1.useDHCP = false;
    interfaces.wlp9s0.useDHCP = false;
    interfaces.eno2.useDHCP = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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

  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [pkgs.amdvlk];
    extraPackages32 = [pkgs.driversi686Linux.amdvlk];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    curl
    expat
    fontconfig
    freetype
    fuse
    fuse3
    glib
    icu
    libclang.lib
    libdbusmenu
    libxcrypt-legacy
    libxml2
    nss
    openssl
    python3
    stdenv.cc.cc
    xorg.libX11
    xorg.libXcursor
    xorg.libXext
    xorg.libXi
    xorg.libXrender
    xorg.libXtst
    xz
    zlib
  ];
}
