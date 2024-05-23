{pkgs, ...}: {
  home.packages = [pkgs.neovide];
  home.file.".config/neovide/config.toml".source = ./plugins/neovide.toml;

  programs.neovim = let
    addWithFile = pluginName: {
      plugin = pkgs.vimPlugins.${pluginName};
      type = "lua";
      config = builtins.readFile (toString ./. + "/plugins/" + pluginName + ".lua");
    };
  in {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./remap.lua}
      ${builtins.readFile ./neovide.lua}
      ${builtins.readFile ./autocmd.lua}
    '';

    extraPackages = with pkgs; [
      lua-language-server
      stylua

      nil
      nixfmt-rfc-style
      nixpkgs-fmt
      alejandra

      nodePackages.intelephense
      phpactor
      php82Packages.php-cs-fixer
      typescript
      nodePackages.typescript-language-server

      prettierd
    ];

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      vim-nix
      neodev-nvim
      indentLine
      # vim-rooter
      # codeium-vim

      # (addWithFile "auto-save-nvim")
      (addWithFile "catppuccin-nvim")
      (addWithFile "comment-nvim")
      (addWithFile "conform-nvim")
      (addWithFile "harpoon2")
      (addWithFile "neo-tree-nvim")
      (addWithFile "nvim-spectre")
      (addWithFile "undotree")
      (addWithFile "vim-fugitive")
      (addWithFile "which-key-nvim")
      (addWithFile "lazygit-nvim")

      (addWithFile "lualine-nvim")

      (addWithFile "nvim-lspconfig")

      (addWithFile "nvim-cmp")
      luasnip
      cmp_luasnip
      friendly-snippets
      cmp-nvim-lsp

      (addWithFile "telescope-nvim")
      telescope-ui-select-nvim
      telescope-fzf-native-nvim
      telescope-file-browser-nvim

      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = "${builtins.readFile ./plugins/nvim-treesitter.lua}";
      }
    ];
  };
}
