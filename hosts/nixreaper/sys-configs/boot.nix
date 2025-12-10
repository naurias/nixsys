{
  config,
  lib,
  pkgs,
  inputs,
  chaotic,
  ...
}: {


  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
