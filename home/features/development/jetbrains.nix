{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.development.jetbrains;
in {
  options.features.development.jetbrains.enable = mkEnableOption "Installing emacs";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains-toolbox
    ];
  };
}
