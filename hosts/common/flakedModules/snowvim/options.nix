{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      enableLuaLoader = true;
      globals = {
        mkdp_markdown_css = "/home/nix/nixsys/hosts/common/flakedModules/snowvim/markdown.css";
      };

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
      };
    };
  };
}
