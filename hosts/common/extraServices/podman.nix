{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.extraServices.podman;
in {
  options.extraServices.podman.enable = mkEnableOption "enabling podman systemwide";

  config = mkIf cfg.enable {
    virtualisation = {
      podman = {
        package = pkgs.stable.podman;
        enable = true;
        dockerCompat = true;
      };
    };
    environment.systemPackages = with pkgs; [
      stable.podman-compose
      stable.distrobox
    ];
  };
}
