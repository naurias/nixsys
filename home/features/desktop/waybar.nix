{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.waybar;
in
{
  options.features.desktop.waybar.enable = mkEnableOption "Enabling dunst";

  config = mkIf cfg.enable {

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = [
            "ext/workspaces"
            "wlr/taskbar"
          ];
          modules-center = [ "dwl/window" ];
          modules-right = [
            "pulseaudio"
            "clock"
            "tray"
          ];

          "wlr/taskbar" = {
            format = "{icon}";
            icon-size = 14;
            tooltip-format = "{title}";
            on-click = "activate";
            on-click-middle = "close";
          };
          "dwl/window" = {
            tooltip = true;
          };
          "tray" = {
            spacing = 10;
          };
          "clock" = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "pulseaudio" = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
          };
        };
      };
      style = ''
              * {
            border: none;
            border-radius: 0;
            font-family: Jetbrains Mono Medium;
            font-size: 10pt;
            min-height: 0;
        }

      '';
    };
  };
}
