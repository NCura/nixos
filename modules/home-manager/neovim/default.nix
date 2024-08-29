{
  config,
  pkgs,
  ...
}: {
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/nicolas/nixos/modules/home-manager/files/nvim";

  home.packages = with pkgs; [
    ### Language servers
    # cssls
    # css_variables
    # html
    # jsonls
    lua-language-server
    marksman
    nil
    sqls
    vscode-langservers-extracted

    ### DAP

    ### Linter
    markdownlint-cli

    ### Formatters
    # HTML
    # htmlbeautifier

    # Javascript
    prettierd

    # JSON
    jsonfmt

    # Lua
    stylua

    # Nix
    nixfmt-rfc-style
    nixpkgs-fmt
    alejandra

    # PHP
    php82Packages.php-cs-fixer

    # Shell
    shfmt

    # TOML
    taplo
  ];
}
