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
      python3Full
      isort
      python313Packages.pytest
      pipenv
      php
      gcc
      qutebrowser
      nyxt
      kdePackages.okular
      kdePackages.dolphin
      kdePackages.qtsvg
      kdePackages.kio-fuse
    ];
    programs.firefox.enable = true;
  };
}
