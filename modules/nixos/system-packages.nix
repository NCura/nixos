{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "freeimage-unstable-2021-11-01"
    "electron-25.9.0"
  ];
  
  # To search, run: nix search wget
  environment.systemPackages = with pkgs; [
   vim neovim micro
   wget curl git
   eza fzf atuin bat
   btop htop glances
   wl-clipboard
   lm_sensors
   liquidctl
   neofetch
#   noto-fonts-color-emoji
#   material-icons
  ];
  
  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ]; 
}