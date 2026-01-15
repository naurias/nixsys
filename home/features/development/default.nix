{pkgs, ...}: {
  # emacs is used here nvf is used as module
  imports = [
    ./emacs.nix
    ./jetbrains.nix
    #   ./lazysnow.nix
  ];
}
