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

      settings.vim = {
        theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        binds.whichKey = {
          enable = true;
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          enableDAP = true;
          #          enableExtraDiagnostics = true;
          enableFormat = true;
          
          yaml = {
            enable = true;
          };

          nix = {
            enable = true;
            lsp.server = "nixd";
          };
          #          ts.enable = true;

        };
      };
    };
  };
}
