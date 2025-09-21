{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.cloud;
in {
  options.features.apps.cloud.enable = mkEnableOption "Cloud providers";

  config =
    mkIf cfg.enable {
      home.packages = with pkgs; [
        filen-desktop
      ];
    };
}
