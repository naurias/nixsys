{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.development.snowmacs;
in {
  options.features.development.snowmacs.enable = mkEnableOption "Installing emacs";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      emacs-pgtk
      nixfmt
    ];
  };
}
