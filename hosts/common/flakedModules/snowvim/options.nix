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
