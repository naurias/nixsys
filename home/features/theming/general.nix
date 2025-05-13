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
    services.hyprpaper.enable = true;

    #theming options go here mainly stylix
    stylix.targets.ghostty.enable = false;
    # cursor
    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";
    stylix.cursor.size = 18;
    # icons
    stylix.iconTheme.enable = true;
    stylix.iconTheme.package = pkgs.papirus-icon-theme;
    stylix.iconTheme.dark = "Papirus-Dark";
    stylix.iconTheme.light = "Papirus";
    # ghostty
    programs.ghostty = {
      settings = {
          theme = "GruvboxDark";
          font-family = "Maple Mono NF";
          font-size = 15;
          window-decoration = "none";
        };
    };

    qt.enable = true;
    gtk.enable = true;
  };
}
