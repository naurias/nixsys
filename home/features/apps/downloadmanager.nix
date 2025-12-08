{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs.nur.repos.forkprince; [
    ab-download-manager
  ];
}
