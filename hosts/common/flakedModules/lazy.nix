{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    vimPlugins.LazyVim
    lazygit
  ];
}
