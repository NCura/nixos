{
  config,
  pkgs,
  ...
}: {
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nicolas/nixos/modules/home-manager/files/nvim";

  home.packages = with pkgs; [
    # Nix
    nixfmt-rfc-style
    nixpkgs-fmt
    alejandra

    # Javascript
    prettierd

    # PHP
    php82Packages.php-cs-fixer
  ];
}
