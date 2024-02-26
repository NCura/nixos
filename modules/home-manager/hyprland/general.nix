{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "general" = {
        gaps_in = 5;
        gaps_out = 0;
        border_size = 2;
        "col.active_border" = "rgb(deb887)";
        "col.inactive_border" = "rgba(595959aa)";
    
        layout = "dwindle";
    
        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
      };
    };
  };
}