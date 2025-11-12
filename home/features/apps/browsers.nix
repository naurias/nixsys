{
  config,
  lib,
  inputs,
  nur,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.browsers;
in {
  options.features.apps.browsers.enable = mkEnableOption "Terminal emulatros";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      w3m
      brave
    ];
    programs.firefox = {
      enable = true;
      profiles = {
        nix = {
          isDefault = true;
          extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              single-file
              bitwarden
              proton-vpn
              karakeep
              varia-integrator
            ];
          };
        };
      };
    };
  };
}
