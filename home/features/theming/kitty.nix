{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.theming.kitty;
in {
  options.features.theming.kitty.enable = mkEnableOption "theming for kitty";

  config = mkIf cfg.enable {
    stylix.targets.kitty.enable = false;
    programs.kitty = {
      font.name = "FiraCodeNerdFont";
      font.size = 14;
      themeFile = "gruvbox-dark";
      settings = {
        background_opacity = 0.8;
        background_blur = 2;
      };
      extraConfig = ''
        bold_font auto
        italic_font CascadiaCode-Italic
        bold_italic_font CascadiaCode-BoldItalic
      '';
    };
  };
}
