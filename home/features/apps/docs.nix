{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.docs;
in {
  options.features.apps.docs.enable = mkEnableOption "Document Processiiig";

  config =
    mkIf cfg.enable {
      home.packages = with pkgs; [
        texliveFull
        pandoc 
        nb
        socat
        kdePackages.okular
        zathura
        kdePackages.qtsvg
        kdePackages.kio-fuse
      ];
    };
}
