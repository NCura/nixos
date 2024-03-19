{
  config,
  pkgs,
  ...
}: {
  programs.bash.shellAliases = {
    ls = "eza --icons --header --all --long --no-time --no-user --no-permissions --no-filesize --group-directories-first";
    lss = "eza --icons --all --across --group-directories-first";
    lsl = "eza --icons --header --all --long --group-directories-first";

    grep = "grep --color=auto";

    nr = "sudo nixos-rebuild switch --flake ~/nixos/#default";
    ne = "neovide ~/nixos";
    ngc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";

    ".." = "cd ..";
    cat = "bat";

    ncsleep = "sudo systemctl suspend";
    ncreboot = "sudo systemctl reboot";
    ncpoweroff = "sudo systemctl poweroff";

    st-patrimoine = "neovide /var/lib/www/staging.st-patrimoine.com/wp-content/plugins/st-plugin";
  };
}
