{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
    ../features/development
    ../features/theming
    ../features/apps
  ];

  features = {
    cli = {
      zsh.enable = true;
      fzf.enable = true;
      posh.enable = true;
    };
    desktop = {
      fonts.enable = true;
      dunst.enable = true;
      hyprland.enable = true;
      river.enable = false;
    };
    theming = {
      general.enable = true;
      kitty.enable = true;
    };
    development = {
      snowmacs.enable = true;
    };
    apps = {
      terminals.enable = true;
      utils.enable = true;
      browsers.enable = true;
      docs.enable = true;
      cloud.enable = true;
      pass.enable = true;
      media.enable = true;
      filers.enable = true;
    };
  };
}
