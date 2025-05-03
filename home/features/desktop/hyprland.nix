{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {
  options.features.desktop.hyprland.enable = mkEnableOption "Toggleable Desktop Apps for User";

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      extraConfig = ''
        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow
        binde =, XF86AudioRaiseVolume, exec, pactl set-sink-volume 0 +5%
        binde =, XF86AudioLowerVolume, exec, pactl set-sink-volume 0 -5%

      '';
      settings = {
        "$mod" = "SUPER";
        monitor = [
          "eDP-1,disable"
          "HDMI-A-1,2560x1440@60,0x0,1"
        ];

        general = {
          "gaps_in" = 5;
          "gaps_out" = 10;
          "border_size" = 2;

          "layout" = "master";
        };
        input = {
          "kb_layout" = "us";
          "follow_mouse" = 1;
          "sensitivity" = 0;

          touchpad = {
            "natural_scroll" = false;
          };
        };

        decoration = {
          "rounding" = 5;
          blur = {
            "enabled" = true;
            "size" = 5;
            "passes" = 4;
            "new_optimizations" = true;
          };

          shadow = {
            "range" = 4;
            "render_power" = 3;
            "enabled" = true;
          };
          # active and in active opacity goes here
        };
        windowrulev2 = [
          "opacity 0.75 ,class:^(kitty)$"
          "opacity 0.75 ,class:^(emacs)$"
          "opacity 0.75 ,class:^(zathura)$"
        ];

        master = {
          "new_status" = "master";
          "new_on_top" = true;
        };

        animations = {
          "enabled" = false;
        };

        "$menu" = ''rofi -show drun -show-icons -run-command "uwsm app -- {cmd}" '';

        bind = [
          "$mod, RETURN, exec,uwsm app -- kitty"
          "$mod SHIFT, Q, exit,"
          "$mod, W, killactive,"
          "$mod, S, togglefloating,"
          "$mod, D, exec, $menu"
          "$mod, Tab, exec, rofi -show window -show-icons"
          "Alt, Tab, cyclenext"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, fullscreenstate"
          "$mod, M, fullscreen, 1"

          "$mod, left, movefocus, l"
          "$mod, H, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, L, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, K, movefocus, u"
          "$mod, down, movefocus, d"
          "$mod, J, movefocus, d"
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, L, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, J, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
          "$mod SHIFT, J, movewindow, d"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          "$mod SHIFT, 1, movetoworkspacesilent, 1"
          "$mod SHIFT, 2, movetoworkspacesilent, 2"
          "$mod SHIFT, 3, movetoworkspacesilent, 3"
          "$mod SHIFT, 4, movetoworkspacesilent, 4"
          "$mod SHIFT, 5, movetoworkspacesilent, 5"
          "$mod SHIFT, 6, movetoworkspacesilent, 6"
          "$mod SHIFT, 7, movetoworkspacesilent, 7"
          "$mod SHIFT, 8, movetoworkspacesilent, 8"
          "$mod SHIFT, 9, movetoworkspacesilent, 9"
          "$mod SHIFT, 0, movetoworkspacesilent, 10"

          "Alt SHIFT, 1, movetoworkspace, 1"
          "Alt SHIFT, 2, movetoworkspace, 2"
          "Alt SHIFT, 3, movetoworkspace, 3"
          "Alt SHIFT, 4, movetoworkspace, 4"
          "Alt SHIFT, 5, movetoworkspace, 5"
          "Alt SHIFT, 6, movetoworkspace, 6"
          "Alt SHIFT, 7, movetoworkspace, 7"
          "Alt SHIFT, 8, movetoworkspace, 8"
          "Alt SHIFT, 9, movetoworkspace, 9"
          "Alt SHIFT, 0, movetoworkspace, 10"
        ];
      };
    };
  };
}
