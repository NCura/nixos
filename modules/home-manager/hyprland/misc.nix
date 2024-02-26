{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "misc" = {
        force_default_wallpaper = -1;
      };
    };
  };
}