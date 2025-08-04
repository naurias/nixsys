{config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs-pgtk
    libtool
    libvterm
    emacsPackages.vterm
    texliveFull
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
  ];
}
