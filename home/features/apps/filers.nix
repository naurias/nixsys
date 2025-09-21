{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.filers;
in {
  options.features.apps.filers.enable = mkEnableOption "Media Management";

  config =
    mkIf cfg.enable {
      home.packages = with pkgs; [
        lxqt.pcmanfm-qt
        kdePackages.dolphin
      ];
    };
}
