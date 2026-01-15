{config, pkgs, lib, inputs, ...}:
{
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.default
  ];
}
