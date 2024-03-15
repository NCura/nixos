{ config, pkgs, inputs, ... }:

let
  wallpaperPath = "/home/nicolas/nixos/assets/wallpapers/default-big.png";
  startupScriptPath = ./startup.sh;
  startupScript = pkgs.writeScriptBin "startup-hyprland" (builtins.readFile startupScriptPath);
in
{

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
      #      monitor = "DP-1, modeline 6511.45 7680 8416 9288 10896 2160 2161 2164 2490 +hsync -vsync, 0x0, 1";
      #        monitor = "DP-1, 7680x2160, auto, auto";
      monitor = [
        "DP-1, modeline 6511.45 7680 8416 9288 10896 2160 2161 2164 2490 +hsync -vsync, auto, auto"
        "DP-1, 7680x2160, auto, auto"
      ];
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
