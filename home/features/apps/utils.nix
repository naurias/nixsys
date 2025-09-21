{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.apps.utils;
in {
  options.features.apps.utils.enable = mkEnableOption "Terminal emulatros";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      coreutils
      unzip
      oh-my-posh
      exiftool
      zsh-fzf-tab
      fd
      wl-clipboard
      peazip
      _7zz
      ffmpeg
      ffmpegthumbnailer
      poppler
      htop
      fastfetch
      httpie
      jq
      cryfs
      procs
      ripgrep
      tldr
      zip
      graphviz
      go-grip
      mermaid-cli
      maim
      shfmt
      shellcheck
      gnumake
      nodejs
      cmake
      gcc
      php 
      python312
    ];
  };
}
