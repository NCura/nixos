{
  wayland.windowManager.hyprland = {
    settings = {
      "animations" = {
        enabled = "yes";

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 0, 7, myBezier"
          "windowsOut, 0, 7, default, popin 80%"
          "border, 0, 10, default"
          "borderangle, 0, 8, default"
          "fade, 0, 7, default"
          "workspaces, 0, 6, default"
        ];
      };
    };
  };
}
