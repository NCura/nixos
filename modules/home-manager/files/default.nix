{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/neovide/config.toml".source = ./neovide.toml;
    "bin/toggle-st-patrimoine.sh".source = ./bin/toggle-st-patrimoine.sh;
    "bin/open-neovide.sh".source = ./bin/open-neovide.sh;
    ".local/share/fonts" = {
      source = ./fonts;
      recursive = true;
    };
  };
}
