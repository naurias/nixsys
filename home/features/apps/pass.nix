{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.pass;
in {
  options.features.apps.pass.enable = mkEnableOption "Password management";

  config =
    mkIf cfg.enable {
      home.packages = with pkgs; [
        bitwarden-desktop
        bitwarden-cli
      ];
    };
}
