{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.vpn;
in {
  options.extraServices.vpn.enable = mkEnableOption "Resolved configs for wireguard vpn";

  config = mkIf cfg.enable {
    services.udisks2.enable = true;
    services.resolved.enable = false;
    services.gvfs.enable = true;
  };
}
