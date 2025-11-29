{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.flakedModules.stylix;
in {
  options.flakedModules.stylix.enable = mkEnableOption "System-wide theming for applications";

  config = mkIf cfg.enable {
    stylix.enable = true;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    stylix.image = ../../../wallpapers/purplish-mountains.png;
    # Fonts
    stylix.fonts = {
      #  sizes = {
      #   terminal = 14;
      # };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.ubuntu-sans;
        name = "Ubuntu Sans";
      };
    };

    # Disabling some options
    stylix.targets.nvf.enable = false;
  };
}
