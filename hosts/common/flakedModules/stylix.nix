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
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.image = ./1.jpg;

    # Fonts
    #    stylix.fonts = {
      #  sizes = {
      #   terminal = 14;
    # };
      # monospace = {
      #   package = pkgs.maple-mono.NF-unhinted;
      #  name = "MapleMono NF";
    # };
    #};


    # Disabling some options
    stylix.targets.nvf.enable = false;

  };
}
