{ config, pkgs, lib, inputs, ... }: {
  imports = [
      ./../../modules/home-manager/hyprland/hyprland.nix
      ./../../modules/home-manager/waybar/waybar.nix
      ./../../modules/home-manager/bash.nix
      ./../../modules/home-manager/files.nix
      ./../../modules/home-manager/kitty.nix
      ./../../modules/home-manager/packages.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
  home.username = "nicolas";
  home.homeDirectory = "/home/nicolas";
  home.sessionVariables = {
    # EDITOR = "emacs";
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
    
  xdg = {
    userDirs = {
        enable = true;
        createDirectories = true;
    };
  };
  
  xdg.mimeApps = {
    enable = true;
    
    defaultApplications = {
      "text/html" = "vivaldi-stable.desktop";
      "x-scheme-handler/http" = "vivaldi-stable.desktop";
      "x-scheme-handler/https" = "vivaldi-stable.desktop";
      "x-scheme-handler/about" = "vivaldi-stable.desktop";
      "x-scheme-handler/unknown" = "vivaldi-stable.desktop";
      "x-scheme-handler/jetbrains" = "jetbrains-toolbox.desktop";
      "x-scheme-handler/fleet" = "jetbrains-fleet.desktop";
    };
  };
}
