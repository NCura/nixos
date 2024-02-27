{ config, pkgs, inputs, ... }:

let
  wallpaperPath = "/home/nicolas/nixos/assets/wallpapers/default.jpg";
  startupScriptPath = ./startup.sh;
  startupScript = pkgs.writeScriptBin "startup-hyprland" (builtins.readFile startupScriptPath);
in {
  
  imports = [
    ./animations.nix
    ./decoration.nix
    ./general.nix
    ./input.nix
    ./keybinds.nix
    ./misc.nix
    
    #./plugins/border-plus-plus.nix
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      exec-once = ''${startupScript}/bin/startup-hyprland'';
      monitor = ", 3440x1440@120, auto, auto";
    };
  };
  
  home.packages = with pkgs; [
    hyprpaper
  ];
  
   home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaperPath}
    wallpaper = ,${wallpaperPath}
    splash = false
    ipc = off
  '';
}