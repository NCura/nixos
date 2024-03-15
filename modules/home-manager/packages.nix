{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    vivaldi
    firefox
    qutebrowser
    chromium
    opera
    libvirt
    swww
    grim
    slurp
    swaynotificationcenter
    swayidle
    swaylock
    rofi-wayland
    imv
    gimp
    pavucontrol
    #    font-awesome
    spotify
    rustup
    #    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    gnome.adwaita-icon-theme
    sublime4
    vscode
    jetbrains-toolbox
    jetbrains.rider
    jetbrains.phpstorm
    playerctl
    discord
    whatsapp-for-linux
    obsidian
    notion-app-enhanced
    filezilla
  ];
}
