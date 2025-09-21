{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.media;
in {
  options.features.apps.media.enable = mkEnableOption "Media Management";

  config =
    mkIf cfg.enable {
      home.packages = with pkgs; [
        mpv 
        vlc
        obs-studio
        qbittorrent
      ];
    };
}
