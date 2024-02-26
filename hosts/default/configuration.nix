# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/nixos/main-user.nix
      ./../../modules/nixos/aliases.nix
      ./../../modules/nixos/session-variables.nix
      ./../../modules/nixos/openrgb.nix
      inputs.home-manager.nixosModules.default
    ];
  
  virtualisation.libvirtd = {
    enable = true;
    onShutdown = "suspend";
    onBoot = "ignore";
    qemu = {
      package = pkgs.qemu_kvm;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
      swtpm.enable = true;
      runAsRoot = false;
    };
  };

  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };
  
    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    };
  };

  programs.virt-manager.enable = true;

  programs.steam = {
  	enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "amdgpu.dc=1" ]; # For OpenRGB
  boot.kernelModules = [ "kvm-amd" ];

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    videoDrivers = ["amdgpu"];
    xkb.layout = "es";
    xkb.variant = "";
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
  
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
  hardware.pulseaudio.extraConfig = "
    load-module module-switch-on-connect
  ";
  services.blueman.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
  
  # Configure console keymap
  console.keyMap = "es";

  # Enable automatic login for the user.
  services.getty.autologinUser = "nicolas";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
  ];
  # xdg.portal.wlr.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim
   neovim
   micro
   wget
   git
   eza
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
