{
  config,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
    "electron-25.9.0"
    "openssl-1.1.1w" # sublime4
  ];

  # To search, run: nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim
    micro
    wget
    curl
    git
    eza
    fzf
    atuin
    bat
    zip
    unzip
    btop
    htop
    glances
    wl-clipboard
    lm_sensors
    liquidctl
    neofetch
    wlr-randr
    ripgrep
    sshfs
    #   material-icons
    # (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    noto-fonts-color-emoji
    symbola
  ];
}
