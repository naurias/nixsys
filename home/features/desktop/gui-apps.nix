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
      obs-studio
      qbittorrent
      nb
      w3m
      texliveFull
      graphviz
      pandoc
      go-grip
      mermaid-cli
      maim
      graphviz
      shfmt
      shellcheck
      gnumake
      nodejs
      cmake
      nixfmt
      python312
      isort
      python312Packages.pytest
      pipenv
      php
      gcc
      kdePackages.okular
      kdePackages.dolphin
      kdePackages.qtsvg
      kdePackages.kio-fuse
    ];
  };
}
