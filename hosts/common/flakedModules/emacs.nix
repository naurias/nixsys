{config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs-pgtk
    libtool
    libvterm
    emacsPackages.vterm

  ];
}
