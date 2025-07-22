{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {
  options.features.desktop.hyprland.enable = mkEnableOption "Hyprland Wayland Compositor";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
      swappy
      ydotool
      hyprpolkitagent
      hyprland-qtutils # needed for banners and ANR messages
    ];

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = ["hyprland/workspaces" "wlr/taskbar"];
          modules-center = ["hyprland/window"];
          modules-right = ["pulseaudio" "clock" "tray"];

          "wlr/taskbar" = {
            format = "{icon}";
            icon-size = 14;
            tooltip-format = "{title}";
            on-click = "activate";
            on-click-middle = "close";
          };
          "hyprland/window" = {
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
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        env = [
          "NIXOS_OZONE_WL, 1"
          "XDG_CURRENT_DESKTOP, Hyprland"
          "XDG_SESSION_TYPE, wayland"
          "XDG_SESSION_DESKTOP, Hyprland"
          "GDK_BACKEND, wayland, x11"
          "CLUTTER_BACKEND, wayland"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "MOZ_ENABLE_WAYLAND, 1"
          "ELECTRON_OZONE_PLATFORM_HINT,wayland"
          "GDK_SCALE,1"
          "QT_SCALE_FACTOR,1"
        ];

        bind = [
          "$mod, Return, exec, kitty"
          "$mod, D, exec, rofi -show drun -show-icons"
          "$mod, W, killactive,"
          "$mod, F, fullscreen,"
          "$mod, M, fullscreenstate, 1"
          "$mod SHIFT, F, fullscreenstate, 0 2"
          "$mod, S, togglefloating,"
          "$mod ALT, F,workspaceopt, allfloat"
          "$mod SHIFT, Q, exit,"
          "$mod SHIFT,left,movewindow,l"
          "$mod SHIFT,right,movewindow,r"
          "$mod SHIFT,up,movewindow,u"
          "$mod SHIFT,down,movewindow,d"
          "$mod SHIFT,H,movewindow,l"
          "$mod SHIFT,J,movewindow,r"
          "$mod SHIFT,K,movewindow,u"
          "$mod SHIFT,L,movewindow,d"
          "$mod ALT, left, swapwindow,l"
          "$mod ALT, right, swapwindow,r"
          "$mod ALT, up, swapwindow,u"
          "$mod ALT, down, swapwindow,d"
          "$mod,left,movefocus,l"
          "$mod,right,movefocus,r"
          "$mod,up,movefocus,u"
          "$mod,down,movefocus,d"
          "$mod,H,movefocus,l"
          "$mod,L,movefocus,r"
          "$mod,K,movefocus,u"
          "$mod,J,movefocus,d"

          "$mod,1,workspace,1"
          "$mod,2,workspace,2"
          "$mod,3,workspace,3"
          "$mod,4,workspace,4"
          "$mod,5,workspace,5"
          "$mod,6,workspace,6"
          "$mod,7,workspace,7"
          "$mod,8,workspace,8"
          "$mod,9,workspace,9"
          "$mod,0,workspace,10"

          "$mod,parenleft,workspace,1"
          "$mod,parenright,workspace,2"
          "$mod,braceright,workspace,3"
          "$mod,plus,workspace,4"
          "$mod,braceleft,workspace,5"
          "$mod,bracketright,workspace,6"
          "$mod,bracketleft,workspace,7"
          "$mod,exclam,workspace,8"
          "$mod,equal,workspace,9"

          "$mod SHIFT,parenleft,workspace,1"
          "$mod SHIFT,parenright,workspace,2"
          "$mod SHIFT,braceright,workspace,3"
          "$mod SHIFT,plus,workspace,4"
          "$mod SHIFT,braceleft,workspace,5"
          "$mod SHIFT,bracketright,workspace,6"
          "$mod SHIFT,bracketleft,workspace,7"
          "$mod SHIFT,exclam,workspace,8"
          "$mod SHIFT,equal,workspace,9"

          "$mod SHIFT,V,movetoworkspace,special"
          "$mod,V,togglespecialworkspace"

          "$mod SHIFT,1,movetoworkspace,1"
          "$mod SHIFT,2,movetoworkspace,2"
          "$mod SHIFT,3,movetoworkspace,3"
          "$mod SHIFT,4,movetoworkspace,4"
          "$mod SHIFT,5,movetoworkspace,5"
          "$mod SHIFT,6,movetoworkspace,6"
          "$mod SHIFT,7,movetoworkspace,7"
          "$mod SHIFT,8,movetoworkspace,8"
          "$mod SHIFT,9,movetoworkspace,9"
          "$mod SHIFT,0,movetoworkspace,10"

          "$mod CONTROL,right,workspace,e+1"
          "$mod CONTROL,left,workspace,e-1"
          "$mod,mouse_down,workspace, e+1"
          "$mod,mouse_up,workspace, e-1"
          "ALT,Tab,cyclenext"
          "ALT,Tab,bringactivetotop"
          ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioPause, exec, playerctl play-pause"
          ",XF86AudioNext, exec, playerctl next"
          ",XF86AudioPrev, exec, playerctl previous"
          ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
          ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
        animations = {
          enabled = true;
          bezier = [
            "wind, 0.05, 0.9, 0.1, 1.05"
            "winIn, 0.1, 1.1, 0.1, 1.1"
            "winOut, 0.3, -0.3, 0, 1"
            "liner, 1, 1, 1, 1"
          ];
          animation = [
            "windows, 1, 6, wind, slide"
            "windowsIn, 1, 6, winIn, slide"
            "windowsOut, 1, 5, winOut, slide"
            "windowsMove, 1, 5, wind, slide"
            "border, 1, 1, liner"
            "fade, 1, 10, default"
            "workspaces, 1, 5, wind"
          ];
        };
        exec-once = [
          "waybar"
          "wl-paste --type text --watch cliphist store # Stores only text data"
          "wl-paste --type image --watch cliphist store # Stores only image data"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "systemctl --user start hyprpolkitagent"
        ];
        "$mod" = "SUPER";
        input = {
          kb_layout = "us,us";
          kb_variant = ",dvp";
          resolve_binds_by_sym = 1;
          numlock_by_default = false;
          repeat_delay = 200;
          follow_mouse = 1;
          float_switch_override_focus = 0;
          sensitivity = 0;
          touchpad = {
            natural_scroll = false;
            scroll_factor = 0.8;
          };
        };
        general = {
          layout = "master";
          gaps_in = 4;
          gaps_out = 4;
          border_size = 2;
        };
        decoration = {
          rounding = 5;
        };
        master = {
          new_status = "master";
          new_on_top = true;
          mfact = 0.6;
        };
      };
      extraConfig = "
      monitor=eDP-1,1920x1080@60,0x0,1
      # To enable blur on waybar uncomment the line below
      # Thanks to SchotjeChrisman
      #layerrule = blur,waybar
    ";
    };
  };
}
