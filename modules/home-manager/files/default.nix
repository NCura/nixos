{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/neovide/config.toml".source = ./neovide.toml;
    "bin/toggle-st-patrimoine.sh".source = ./toggle-st-patrimoine.sh;
  };
  home.file.".local/share/fonts" = {
    source = ./fonts;
    recursive = true;
  };
}
