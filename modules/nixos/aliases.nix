{ config, pkgs, ... }:

{
  programs.bash.shellAliases = {
    ls = "eza --icons --header --all --long --no-time --no-user --no-permissions --no-filesize --group-directories-first";
    lss = "eza --icons --all --across --group-directories-first";
    lsl = "eza --icons --header --all --long --group-directories-first";
    
    grep = "grep --color=auto";
    
    nr = "sudo nixos-rebuild switch --flake ~/nixos/#default";
    nh = "micro ~/nixos/hosts/default/home.nix";
    nc = "micro ~/nixos/hosts/default/configuration.nix";
  };
}
