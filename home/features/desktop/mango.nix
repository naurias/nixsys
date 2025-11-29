{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.mango;
in
{
  options.features.desktop.mango.enable = mkEnableOption "Enabling dunst";

  config = mkIf cfg.enable {
    home.file = {
      ".config/mango/config.conf" = {
        source = "${inputs.dotfiles}/mango/config.conf";
      };
      ".config/mango/autostart.sh" = {
        source = "${inputs.dotfiles}/mango/autostart.sh";
        executable = true;
      };
      ".config/DankMaterialShell" = {
        source = "${inputs.dotfiles}/DankMaterialShell";
        recursive = true;
      };
    };
  };
}
