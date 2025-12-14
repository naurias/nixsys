{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.niri;
in
{
  options.features.desktop.niri.enable = mkEnableOption "Enabling dunst";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      slurp
      swappy
      ydotool
      xwayland-satellite
    ];
    programs.niri.settings = {
      input.keyboard.xkb = {
        layout = "us,graphite";
        variant = ",";
        options = "grp:alt_space_toggle";
      };
      outputs."eDP-1" = {
        mode.width = 1920;
        mode.height = 1080;
        mode.refresh = 60.0;
        position.x = 0;
        position.y = 0;
        scale = 1;

      };
      input.touchpad.natural-scroll = false;
      input.focus-follows-mouse.enable = true;
      input.focus-follows-mouse.max-scroll-amount = "30%";
      prefer-no-csd = true;
      spawn-at-startup = [
        { command = [ "xwayland-satellite" ]; }
        { command = [ "noctalia-shell" ]; }
      ];
      environment = {
        DISPLAY = ":0";
      };

      layout = {
        gaps = 4;
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
        default-column-width = {
          proportion = 1. / 2.;
        };
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
        };
      };
      binds = with config.lib.niri.actions; {
        # "Mod+D".action = spawn ["rofi" "-show" "drun" "-show-icons"];
        "Mod+W".action = close-window;
        "Mod+F".action = fullscreen-window;
        "Mod+Shift+F".action = toggle-windowed-fullscreen;
        "Mod+M".action = maximize-column;
        "Mod+X".action = expand-column-to-available-width;
        "Mod+C".action = center-column;
        "Mod+O".action = toggle-overview;
        "Mod+Return".action = spawn "kitty";
        "Alt+Shift+Q".action = quit { skip-confirmation = false; };
        "Mod+Shift+Slash".action = show-hotkey-overlay;
        "Mod+S".action = toggle-window-floating;
        "Mod+Shift+Space".action = switch-focus-between-floating-and-tiling;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+G".action = toggle-column-tabbed-display;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;
        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;
        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        #Focus
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Up".action = focus-window-up;
        "Mod+Down".action = focus-window-down;

        "Mod+A".action = focus-column-first;
        "Mod+Z".action = focus-column-last;

        "Mod+Shift+A".action = move-column-to-first;
        "Mod+Shift+Z".action = move-column-to-last;

        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;

        "Mod+Shift+U".action = move-column-to-workspace-down;
        "Mod+Shift+I".action = move-column-to-workspace-up;

        "Mod+Ctrl+U".action = move-workspace-down;
        "Mod+Ctrl+I".action = move-workspace-up;

        "Mod+WheelScrollDown".action = focus-column-right;
        "Mod+WheelScrollUp".action = focus-column-left;

        "Mod+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Shift+WheelScrollUp".action = move-column-left;

        "Alt+WheelScrollDown".action = focus-workspace-down;
        "Alt+WheelScrollUp".action = focus-workspace-up;

        "Alt+Shift+WheelScrollDown".action = move-column-to-workspace-down;
        "Alt+Shift+WheelScrollUp".action = move-column-to-workspace-up;

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+K".action = focus-window-up;
        "Mod+J".action = focus-window-down;

        "Mod+Q".action = focus-column-left;
        "Mod+E".action = focus-column-right;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        "XF86MonBrightnessUp".action.spawn = [
          "brightnessctl"
          "s" 
          "10%+"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "brightnessctl"
          "s"
          "10%-"
        ];
        "XF86AudioRaiseVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1+"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "0.1-"
        ];
        "XF86AudioMute".action.spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];

        # Noctalia 
        "Mod+D".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];

        "Mod+V".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "clipboard"
          ];

        #Move
        "Mod+Shift+Left".action = move-column-left;
        "Mod+Shift+Right".action = move-column-right;
        "Mod+Shift+Up".action = move-window-down;
        "Mod+Shift+Down".action = move-window-up;

        "Mod+Shift+Q".action = move-column-left;
        "Mod+Shift+E".action = move-column-right;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-window-down;
        "Mod+Shift+J".action = move-window-up;

        "Mod+Shift+1".action = move-column-to-index 1;
        "Mod+Shift+2".action = move-column-to-index 2;
        "Mod+Shift+3".action = move-column-to-index 3;
        "Mod+Shift+4".action = move-column-to-index 4;
        "Mod+Shift+5".action = move-column-to-index 5;
        "Mod+Shift+6".action = move-column-to-index 6;
        "Mod+Shift+7".action = move-column-to-index 7;
        "Mod+Shift+8".action = move-column-to-index 8;
        "Mod+Shift+9".action = move-column-to-index 9;

        #"Mod+P".action = screenshot { show-pointer = true; };
        #"Alt+P".action = screenshot-window { write-to-disk = false; } ;
      };
    };
  };
}
