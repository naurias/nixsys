{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.apps.mail-clients;
in
{
  options.features.apps.mail-clients.enable = mkEnableOption "Terminal emulatros";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      #tuta
      #protonmail-desktop
      #thunderbird
    ];
  };
}
