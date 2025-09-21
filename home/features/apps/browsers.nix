{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.browsers;
in {
  options.features.apps.browsers.enable = mkEnableOption "Terminal emulatros";

  config =
    mkIf cfg.enable {
      home.packages = with pkgs; [
        vivaldi
        vivaldi-ffmpeg-codecs
        w3m
        brave
      ];
    };
}
