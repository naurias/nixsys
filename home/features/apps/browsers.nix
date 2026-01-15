{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.apps.browsers;
in
{
  options.features.apps.browsers.enable = mkEnableOption "Terminal emulatros";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      w3m
      nur.repos.forkprince.helium-nightly
      vivaldi
      vivaldi-ffmpeg-codecs
    ];
    programs.floorp = {
      enable = true;
      profiles = {
        nix = {
          isDefault = true;
          extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              single-file
              keepassxc-browser
              proton-vpn
              karakeep
              aria2-integration
            ];
          };
        };
      };
    };
  };
}
