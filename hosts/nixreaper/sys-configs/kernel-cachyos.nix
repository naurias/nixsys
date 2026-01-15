{
  config,
  lib,
  pkgs,
  nix-cachyos-kernel,
  ...
}: {


  nixpkgs.overlays = [ self.overlay ];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
}
