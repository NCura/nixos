{ config, pkgs, ... }:

{
  programs.bash.shellAliases = {
    ls = "ls -la";
    nr = "sudo nixos-rebuild switch --flake ~/nixos/#default";
    nh = "micro ~/nixos/hosts/default/home.nix";
    nc = "micro ~/nixos/hosts/default/configuration.nix";
  };
}
