{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./../../modules/home-manager/files
    ./../../modules/home-manager/hyprland
    ./../../modules/home-manager/waybar
    ./../../modules/home-manager/neovim

    ./../../modules/home-manager/bash.nix
    ./../../modules/home-manager/default-applications.nix
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/kitty.nix
    ./../../modules/home-manager/others.nix
    ./../../modules/home-manager/packages.nix
    ./../../modules/home-manager/qutebrowser.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
  home.username = "nicolas";
  home.homeDirectory = "/home/nicolas";
  # home.sessionVariables = {
  #   # EDITOR = "emacs";
  # };
}
