{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vivaldi
    libvirt
    swww
    grim slurp
    swaynotificationcenter
    swayidle
    swaylock
    rofi-wayland
    imv
    gimp
    pavucontrol
#    font-awesome
    spotify
    neovide
    rustup
#    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
	  openrgb-with-all-plugins
    gnome.adwaita-icon-theme
    jetbrains-toolbox
    jetbrains.rider
    jetbrains.phpstorm
    playerctl
    discord
    whatsapp-for-linux
  ];
}