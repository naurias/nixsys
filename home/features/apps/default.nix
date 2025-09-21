{ config, lib, pkgs, ... }:
{
  imports = [
    ./terminals.nix
    ./utils.nix
    ./browsers.nix
    ./docs.nix
    ./cloud.nix
    ./pass.nix
    ./media.nix
    ./filers.nix

  ];
}
