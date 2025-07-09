{config, ...}:
{
  programs.niri.settings.binds = with config.lib.niri.actions;{
    "Mod+D".action = spawn ["rofi" "-show" "run"];
    "Mod+B".action = spawn "fuzzel";
    "Mod+Shift+Q".action = close-window;
    "Mod+F".action = fullscreen-window;
    "Mod+Return".action = spawn "kitty";
    "Mod+Shift+E".action = quit { skip-confirmation = false; };
    "Mod+Shift+Slash".action = show-hotkey-overlay;
    "Mod+Shift+Space".action = toggle-window-floating;
    "Mod+Space".action = switch-focus-between-floating-and-tiling;

    "Mod+W".action = switch-preset-column-width;
    "Mod+H".action = switch-preset-window-height;
    "Mod+C".action = consume-window-into-column;
    "Mod+X".action = expel-window-from-column;

    #Focus
    "Mod+Left".action = focus-column-or-monitor-left;
    "Mod+Right".action = focus-column-or-monitor-right;
    "Mod+Up".action = focus-window-or-workspace-up;
    "Mod+Down".action = focus-window-or-workspace-down;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    "XF86MonBrightnessUp".action = spawn "brightnessctl s +10%";
    "XF86MonBrightnessDown".action = spawn "brightnessctl s -10%";
    #Move
    "Mod+Shift+Left".action = move-column-left-or-to-monitor-left;
    "Mod+Shift+Right".action = move-column-right-or-to-monitor-right;
    "Mod+Shift+Up".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+Down".action = move-window-up-or-to-workspace-up;

    "Mod+Shift+1".action = move-column-to-index 1;
    "Mod+Shift+2".action = move-column-to-index 2;
    "Mod+Shift+3".action = move-column-to-index 3;
    "Mod+Shift+4".action = move-column-to-index 4;
    "Mod+Shift+5".action = move-column-to-index 5;
    "Mod+Shift+6".action = move-column-to-index 6;
    "Mod+Shift+7".action = move-column-to-index 7;
    "Mod+Shift+8".action = move-column-to-index 8;
    "Mod+Shift+9".action = move-column-to-index 9;

  };
}
