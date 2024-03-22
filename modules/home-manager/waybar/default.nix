{
  imports = [./settings.nix];

  programs.waybar = {
    enable = true;
    style = ./style.css;
  };
}
