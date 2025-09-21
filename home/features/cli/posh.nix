{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.cli.posh;
in {
  options.features.cli.posh.enable = mkEnableOption "enable oh my posh";


 config = mkIf cfg.enable {
    home.file = {
      ".config/ohmyposh" = {
        source = "${inputs.dotfiles}/ohmyposh";
        recursive = true;
      };
    };
  };
}
