{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.terminals;
in {
  options.features.apps.terminals.enable = mkEnableOption "Terminal emulatros";

  config =
    mkIf cfg.enable {
      programs.kitty.enable = true;
    };
}
