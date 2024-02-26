{ config, pkgs, lib, inputs, ... }:

{
  home.username = "nicolas";
  home.homeDirectory = "/home/nicolas";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
      ./../../modules/home-manager/packages.nix
      ./../../modules/home-manager/files.nix
      ./../../modules/home-manager/hyprland/hyprland.nix
      ./../../modules/home-manager/waybar/waybar.nix
      ./../../modules/home-manager/kitty.nix
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24; # or your preferred cursor size
  };
  
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  
  programs.git = {
    enable = true;
    userName = "Nicolas Cura";
    userEmail = "nicolas.cura@icloud.com";
  };
  
  programs.home-manager.enable = true;  
}
