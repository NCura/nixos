{pkgs, ...}: {
  home.packages = [pkgs.neovide];
  programs.neovim = let
    addWithFile = pluginName: {
      plugin = pkgs.vimPlugins.${pluginName};
      type = "lua";
      config = builtins.readFile (toString ./. + "/plugins/" + pluginName + ".lua");
    };
    addWithCommand = {
      pluginName,
      command,
    }: {
      plugin = pkgs.vimPlugins.${pluginName};
      type = "lua";
      config = "${command}";
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
    '';

    extraPackages = with pkgs; [
      lua-language-server
      stylua

      rnix-lsp
      nixfmt-rfc-style
      nixpkgs-fmt
      alejandra

      phpactor
      php82Packages.php-cs-fixer
      typescript
      nodePackages.typescript-language-server

      prettierd
    ];

    plugins = with pkgs.vimPlugins; [
      vim-nix
      neodev-nvim
      indentLine
      vim-rooter

      (addWithFile "conform-nvim")
      (addWithFile "neo-tree-nvim")
      (addWithFile "harpoon2")
      (addWithFile "undotree")
      (addWithFile "vim-fugitive")

      (addWithFile "lualine-nvim")
      nvim-web-devicons

      (addWithFile "nvim-lspconfig")

      (addWithFile "nvim-cmp")
      luasnip
      cmp_luasnip
      friendly-snippets
      cmp-nvim-lsp

      (addWithFile "telescope-nvim")
      telescope-ui-select-nvim
      telescope-fzf-native-nvim

      codeium-vim
      # (addWithCommand { pluginName = "codeium-vim"; command = "require(\"codeium\").setup()"; })
      (addWithCommand {
        pluginName = "comment-nvim";
        command = ''require("Comment").setup()'';
      })
      (addWithCommand {
        pluginName = "catppuccin-nvim";
        command = ''vim.cmd.colorscheme "catppuccin"'';
      })

      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = "${builtins.readFile ./plugins/nvim-treesitter.lua}";
      }
    ];
  };
}
