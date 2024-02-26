{ config, pkgs, inputs, ... }:

let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      eval "$(ssh-agent -s)" > /dev/null
      ssh-add ~/.ssh/github &> /dev/null

      ${pkgs.waybar}/bin/waybar &
      sleep 1
    '';
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
      exec-once = ''${startupScript}/bin/start'';
      monitor = ", preferred, auto, auto";
    };
  };
}