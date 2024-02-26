{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "input" = {
        kb_layout = "es";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
    
        follow_mouse = 1;
    
        touchpad = {
            natural_scroll = "no";
        };
    
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
    };
  };
}