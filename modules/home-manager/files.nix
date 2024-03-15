{ config, pkgs, ... }:

{    
  home.file = {
    ".config/neovide/config.toml".source = ./files/neovide.toml;
  };
}
