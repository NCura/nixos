{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      bind = [
        # --------------------------------------------------------
        # MOD
        # --------------------------------------------------------

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        
        "$mod, Return, exec, kitty"
        "$mod, Space, exec, rofi -show drun -modi drun"
               
        "$mod, Q, killactive,"
        "$mod, R, exec, rofi -show drun -modi drun"
        "$mod, B, exec, vivaldi"
        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        
        # --------------------------------------------------------
        # MOD + SHIFT
        # --------------------------------------------------------   
        
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        
        "$mod SHIFT, W, exec, rofi -show window"
        "$mod SHIFT, T, togglefloating,"
        
        # --------------------------------------------------------
        # MOD + CONTROL
        # --------------------------------------------------------   
        
        "$mod CONTROL, B, exec, pkill waybar && waybar"
        "$mod CONTROL, Q, exit,"
      ];
      
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      
      bindl = [                
        "$mod, XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
        "$mod, XF86AudioPlay, exec, playerctl play-pause"
      ];
      
      bindel = [                
        "$mod, XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        "$mod, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
      ];
    };
  };
}