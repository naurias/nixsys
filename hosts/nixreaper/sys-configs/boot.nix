{
  config,
  lib,
  pkgs,
  inputs,
  chaotic,
  ...
}: {


  boot.loader.limine.enable = true;
  boot.loader.limine.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
