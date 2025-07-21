{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.docker;
in {
  options.extraServices.docker.enable = mkEnableOption "enabling docker systemwide";

  config = mkIf cfg.enable {
    virtualisation = {
      docker = {
        enable = true;
        autoPrune = {
          enable = true;
          flags = [
            "--filter=until=24h"
            "--filter=label!=important"
          ];
        };
      };
    };
    environment.systemPackages = with pkgs; [
      docker-compose
      distrobox
    ];
  };
}
