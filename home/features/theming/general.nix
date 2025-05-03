{
  config,
  lib,
  pkgs,
  ...
}:

with lib; let 
  cfg = config.features.theming.general;
in 
{

  options.features.theming.general.enable = mkEnableOption "stylix theming for home manager settings";

  config = mkIf cfg.enable {

    #theming options go here mainly stylix
    stylix.targets.kitty.enable = false;
    # cursor
    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";
    stylix.cursor.size = 18;
    # icons
    stylix.iconTheme.enable = true;
    stylix.iconTheme.package = pkgs.papirus-icon-theme;
    stylix.iconTheme.dark = "Papirus-Dark";
    stylix.iconTheme.light = "Papirus";
    # kitty
    programs.kitty = {
      font.name = "MapleMono NF";
      font.size = 14;
      themeFile = "gruvbox-dark";
    };

    qt.enable = true;
    gtk.enable = true;
  };
}
