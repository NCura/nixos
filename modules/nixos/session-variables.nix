{ config, pkgs, ... }:

{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";
    
    XCURSOR_SIZE = "24";

    GSETTINGS_BACKEND="keyfile";
  };
}
