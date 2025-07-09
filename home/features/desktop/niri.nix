{
  config,
  lib,
  pkg,
  niri,
  ...
}:
{
   imports = [
       ./binds.nix
    #       ./style.nix
    ];
    programs.niri.settings = {

    input.keyboard.xkb = {
      layout = "us";
    };
    spawn-at-startup = [
      { command = ["xwayland-satellite"]; }
    ];

    environment."DISPLAY" = ":1";
  };
}
