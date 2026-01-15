{
  config,
  pkgs,
  lib,
  ...
}:
{
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
      dunst.enable = false;
      hyprland.enable = true; # be sure to enable/disable sysconfigs/desktop-environments
      river.enable = false;
      niri.enable = true;
      mango.enable = false; # be sure to enable/disable sysmodules/mango and hm-modules/mango along with mango defs in flake.nix
      waybar.enable = false;
    };
    theming = {
      general.enable = true;
      kitty.enable = true;
    };
    development = {
      snowmacs.enable = true;
      jetbrains.enable = true;
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
      mail-clients.enable = true;
    };
  };
}
