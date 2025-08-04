{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./home.nix
    ./dotfiles
    ../common
    ../features/cli
    ../features/desktop
    ../features/development
    ../features/theming
  ];

  # here i am enabling which cli feature (from directory home/feature/cli) will be set to enable.. then those files will check if these options are enabled, if so then settings according to them will be applied

  features = {
    cli = {
      zsh.enable = true;
      fzf.enable = true;
    };
    desktop = {
      yambar.enable = true;
      fonts.enable = true;
      river.enable = true;
      dunst.enable = true;
      gui-apps.enable = true;
      hyprland.enable = true;
      # since this is not machine specific and i want all systems to have river wm the common user settings for river regardless of hosts are applied
      # enable it only if we want host specific features
    };
    theming = {
      general.enable = true;
    };
  };

  # river configuration depending upon host ie the one in features will be common for users on all systems but this one will be host specific
  # letsay we want keyboard ustion in only this ssystem then i'd enable river and define us keymap below
  wayland.windowManager.river = {
    settings = {
      # all users and hosts are of same config so i dont need to add anything here
    };
  };
  wayland.windowManager.hyprland = {
    settings = {};
  };
}
