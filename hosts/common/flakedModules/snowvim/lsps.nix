{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
    };

    formatter.conform-nvim = {
      enable = true;
    };
    diagnostics.nvim-lint = {
      enable = true;
    };
    lsp.lspconfig = {
      enable = true;
    };
    ## Languages
    languages = {
      enableTreesitter = true;
      enableDAP = true;
      enableFormat = true;
      ## Language specifics
      yaml = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };
      nix = {
        enable = true;
        lsp.server = "nixd";
      };
    };
  };
}
