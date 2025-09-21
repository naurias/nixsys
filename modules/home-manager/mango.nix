{ config, lib, pkgs, ... }:
{
  wayland.windowManager.mango = {
    enable = true;
  };
}
