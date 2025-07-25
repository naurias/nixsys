{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.gui-apps;
in {
  options.features.desktop.gui-apps.enable = mkEnableOption "Toggleable Desktop Apps for User";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      lxqt.pcmanfm-qt
      zathura
      mpv
      brave
      keepassxc
      git-credential-keepassxc
      filen-desktop
      vlc
      bitwarden
      obsidian
      obs-studio
      qbittorrent
    ];
    programs.firefox.enable = true;
  };
}
