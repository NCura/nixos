{
  pkgs,
  inputs,
  ...
}: let
  wallpaperPath = "";
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
      exec-once = "${startupScript}/bin/startup-hyprland";
      monitor = [
        "DP-3, modeline 6511.45 7680 8416 9288 10896 2160 2161 2164 2490 +hsync -vsync, auto, auto"
        # "DP-3, 7680x2160@240, auto, auto"
        # "DP-3, 7680x2160, auto, auto"
      ];
    };
  };

  home.packages = with pkgs; [
    hyprpaper
    hypridle
    hyprlock
    hyprcursor
  ];

  # environment.systemPackages = with pkgs; [
  #   hypridle
  #   hyprlock
  #   hyprcursor
  # ];

  home.file = {
    ".config/hypr/hyprpaper.conf".source = ./plugins/hyprpaper.conf;
    ".config/hypr/hypridle.conf".source = ./plugins/hypridle.conf;
  };
}
