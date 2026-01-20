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
      brave
    ];
  };
}
