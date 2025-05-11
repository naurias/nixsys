{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.development.snowmacs;
in {
  options.features.development.snowmacs.enable = mkEnableOption "Installing emacs";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      emacs-pgtk
      libvterm
      emacsPackages.vterm
      texliveFull
      pandoc
      maim 
      wl-clipboard
      graphviz
      shfmt
      shellcheck
      nodePackages_latest.nodejs
    ];
  };
}
