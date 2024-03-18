{pkgs, ...}: let
  browsers = with pkgs; [
    vivaldi
    firefox
    chromium
    opera
  ];

  ides = with pkgs; [
    vscode
    sublime4
  ];

  myPrograms = with pkgs; [
    discord
    obsidian
    gimp
    spotify
    whatsapp-for-linux
  ];

  hyprlandTools = with pkgs; [
    swaynotificationcenter
    swayidle
    swaylock
    rofi-wayland
  ];

  audioTools = with pkgs; [
    pavucontrol
    playerctl
  ];

  webTools = with pkgs; [
    filezilla
    nmap
  ];

  others = with pkgs; [
    rsync
    libvirt
    swww
    grim
    slurp
    imv
    # font-awesome
    rustup
    gnome.adwaita-icon-theme
  ];

  combinedPackages =
    browsers ++ ides ++ myPrograms ++ hyprlandTools ++ audioTools ++ webTools ++ others;
in {
  home.packages = combinedPackages;
}
