{pkgs, ...}: {
  home.file = {
    "bin/toggle-st-patrimoine.sh".source = ./bin/toggle-st-patrimoine.sh;
    "bin/open-neovide.sh".source = ./bin/open-neovide.sh;
    ".local/share/fonts" = {
      source = ./fonts;
      recursive = true;
    };
    ".local/share/icons/Bibata-Modern-ice" = {
      source = ./cursors/Bibata-Modern-ice;
      recursive = true;
    };
  };
}
