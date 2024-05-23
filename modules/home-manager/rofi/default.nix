{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-bluetooth
      rofi-screenshot
      rofi-power-menu
    ];
    # theme = ./theme.rasi;
  };
}
