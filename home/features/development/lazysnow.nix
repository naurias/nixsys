{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.development.lazysnow;
in {
  options.features.development.lazysnow.enable = mkEnableOption "Installing emacs";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      neovim
      lazygit
      gcc
    ];


  };
}
