{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
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

    utility.preview.markdownPreview = {
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

    ui.noice = {
      enable = true;
    };
    mini.icons = {
      enable = true;
    };

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        picker = {enabled = true;};
        explorer = {enabled = true;};
        bigfile = {enabled = true;};
        debug = {enabled = true;};
        indent = {enabled = true;};
        image = {enabled = true;};
        notifier = {enabled = true;};
        scratch = {enabled = true;};
        statuscolumn = {enabled = false;};
        quickfile = {enabled = true;};
      };
    };
    #    utility.images.image-nvim = {
    #      enable = true;
    #      setupOpts.backend = "kitty";
    #    };

    #    notes.obsidian = {
    #      enable = true;
    #      setupOpts = {
    #        completion.nvim_cmp = false;
    #        daily_notes.folder = "/home/nix/Documents/Obsidian/Vault/RandomNotes";
    #        #workspaces.name = "Vault";
    #        #workspaces.path = "/home/nix/Documents/Obsidian/Vault";
    #        ui = {enable = false;};
    #        workspaces = [
    #        {
    #          name = "Vault";
    #          path = "/home/nix/Documents/Obsidian/Vault";
    #        }
    #        ];
    #      };
    #    };

    snippets.luasnip.enable = true;
    mini.comment.enable = true;
    mini.snippets.enable = true;
    mini.surround.enable = true;
    debugger.nvim-dap.enable = true;
    debugger.nvim-dap.ui.enable = true;
    utility.outline.aerial-nvim.enable = true;
    fzf-lua.enable = true;
    statusline.lualine.enable = true;
    autocomplete.blink-cmp.enable = true;
    extraPlugins = with pkgs.vimPlugins; {
      nui-nvim = {
        package = nui-nvim;
      };
    };

    # custom plugins
    startPlugins = [
      pkgs.vimPlugins.ts-comments-nvim
      pkgs.vimPlugins.grug-far-nvim
    ];
  };
}
