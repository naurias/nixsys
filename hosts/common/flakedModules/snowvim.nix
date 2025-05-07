{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.flakedModules.snowvim;
in {
  options.flakedModules.snowvim.enable = mkEnableOption "neovim declrative configuration with nvf";

  config = mkIf cfg.enable {
    programs.nvf = {
      enable = true;
      # Main settings
      settings.vim = {
        # theme
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        # custom options
        options = {
          tabstop = 2;
          shiftwidth = 2;
        };
        # custom plugins

        # mini pairs plugin
        # which key plugin
        binds.whichKey = {
          enable = true;
        };
        # mini pairs plugin
        mini.pairs = {
          enable = true;
        };
        # bufferline
        mini.ai = {
          enable = true;
        };
        # flash.nvim
        utility.motion.flash-nvim = {
          enable = true;
        };

        git.gitsigns = {
          enable = true;
          codeActions.enable = true;
        };
        lsp.trouble = {
          enable = true;
        };
        notes.todo-comments = {
          enable = true;
        };

        tabline.nvimBufferline = {
          enable = true;
        };

        # custom plugins
        startPlugins = [
          pkgs.vimPlugins.ts-comments-nvim
          pkgs.vimPlugins.grug-far-nvim
        ];

        ############ FORMATTING
        formatter.conform-nvim = {
          enable = true;
        };
        diagnostics.nvim-lint = {
          enable = true;
        };
        lsp.lspconfig = {
          enable = true;
        };
        ################### UI
        ui.noice = {
          enable = true;
        };
        mini.icons = {
          enable = true;
        };

        utility.snacks-nvim = {
          enable = true;
        };

        #################### Extras

        snippets.luasnip.enable = true;
        mini.comment.enable = true;
        mini.snippets.enable = true;
        mini.surround.enable = true;
        debugger.nvim-dap.enable = true;
        debugger.nvim-dap.ui.enable = true;
        utility.outline.aerial-nvim.enable = true;
        fzf-lua.enable = true;

        extraPlugins = with pkgs.vimPlugins; {
          nui-nvim = {
            package = nui-nvim;
          };
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        # autocomplete.blink-cmp.enable = true;

        # languages
        # general
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          enableDAP = true;
          #          enableExtraDiagnostics = true;
          enableFormat = true;

          #yaml
          yaml = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };

          #nix
          nix = {
            enable = true;
            lsp.server = "nixd";
          };
        };
      };
    };
  };
}
