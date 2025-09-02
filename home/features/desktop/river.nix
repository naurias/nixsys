{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.river;
in {
  options.features.desktop.river.enable = mkEnableOption "river nixos configuration";

  config = mkIf cfg.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland.enable = true;
      settings = {
        spawn = [
          "yambar"
        ];
        declare-mode = [
          "passthrough"
        ];
        default-layout = [
          "rivertile"
        ];

        map = {
          normal = {
            "Super Return" = "spawn kitty";
            "Super D" = "spawn 'rofi -show drun -show-icons'";
            "Super W" = "close";
            "Super+Shift Q" = "exit";
            "Super J" = "focus-view next";
            "Super K" = "focus-view previous";
            "Super+Shift J" = "swap next";
            "Super+Shift K" = "swap previous";
            "Super Period" = "focus-output next";
            "Super Comma" = "focus-output previous";
            "Super+Shift Period" = "send-to-output next";
            "Super+Shift Comma" = "send-to-output previous";
            "Super A" = "zoom";
            #					"Super H" = "send-layout-cmd rivertile ''main-ratio -0.05''";
            #					"Super L" = "send-layout-cmd rivertile ''main-ratio +0.05''";
            #					"Super+Shift H" = "send-layout-cmd rivertile ''main-count +1''";
            #					"Super+Shift L" = "send-layout-cmd rivertile ''main-count -1''";
            "Super+Alt H" = "move left 100";
            "Super+Alt J" = "move down 100";
            "Super+Alt K" = "move up 100";
            "Super+Alt L" = "move right 100";
            "Super+Alt+Control H" = "snap left";
            "Super+Alt+Control J" = "snap down";
            "Super+Alt+Control K" = "snap up";
            "Super+Alt+Control L" = "snap right";
            "Super+Alt+Shift H" = "resize horizontal -100";
            "Super+Alt+Shift J" = "resize vertical 100";
            "Super+Alt+Shift K" = "resize horizontal 100";
            "Super+Alt+Shift L" = "resize vertical -100";
            "Super S" = "toggle-float";
            "Super F" = "toggle-fullscreen";
            #					"Super Up" = "send-layout-cmd rivertile ''main-location top''";
            #					"Super Right" = "send-layout-cmd rivertile ''main-location right''";
            #					"Super Down" = "send-layout-cmd rivertile ''main-location bottom''";
            #					"Super Left" = "send-layout-cmd rivertile ''main-location left''";
            "Super F11" = "enter-mode passthrough";
          };
          passthrough = {
            "Super F11" = "enter-mode normal";
          };
        };

        map-pointer = {
          normal = {
            "Super BTN_LEFT" = "move-view";
            "Super BTN_RIGHT" = "resize-view";
            "Super BTN_MIDDLE" = "toggle-float";
          };
        };

        set-repeat = "50 300";
        focus-follows-cursor = "normal";

        #				background-color = "0x002b36";
        # border-color-focused = "0x93a1a1";
        # border-color-unfocused = "0x586e75";
      };

      extraConfig = ''

        						# Super+{Up,Right,Down,Left} to change layout orientation
        						riverctl map normal Super Up    send-layout-cmd rivertile "main-location top"
        						riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
        						riverctl map normal Super Down  send-layout-cmd rivertile "main-location bottom"
        						riverctl map normal Super Left  send-layout-cmd rivertile "main-location left"

                    riverctl map normal Super+Shift N spawn "riverctl keyboard-layout 'graphite'"
                    riverctl map normal Super N spawn "riverctl keyboard-layout 'us'"

        						# Super+H and Super+L to decrease/increase the main ratio of rivertile(1)
        						riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
        						riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"
        						# Super+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)
        						riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
        						riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"

        						all_tags=$(((1 << 32) - 1))
        						riverctl map normal Super 0 set-focused-tags $all_tags
        						riverctl map normal Super+Shift 0 set-view-tags $all_tags

        						for i in $(seq 1 9)
        						do
        							tags=$((1 << ($i - 1)))
        							# Super+[1-9] to focus tag [0-8]
        							riverctl map normal Super $i set-focused-tags $tags
        							# Super+Shift+[1-9] to tag focused view with tag [0-8]
        							riverctl map normal Super+Shift $i set-view-tags $tags
        							# Super+Control+[1-9] to toggle focus of tag [0-8]
        							riverctl map normal Super+Control $i toggle-focused-tags $tags
        							# Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
        							riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
        						done



                    # Focus the whole tag/workspace to current screen 


                    # Focuse currently active window to the respective tags i.e the window will be at more than one workspaces




        						for mode in normal locked
        						do
        							# Eject the optical drive (well if you still have one that is)
        							riverctl map $mode None XF86Eject spawn 'eject -T'
        							# Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
        							riverctl map $mode None XF86AudioRaiseVolume  spawn 'pactl set-sink-volume 0 +5%'
        							riverctl map $mode None XF86AudioLowerVolume  spawn 'pactl set-sink-volume 0 -5%'
        							riverctl map $mode None XF86AudioMute         spawn 'pactl set-sink=mute 0 toggle'
        							# Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
        							riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
        							riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
        							riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
        							riverctl map $mode None XF86AudioNext  spawn 'playerctl next'
        							# Control screen backlight brightness with brightnessctl (https://github.com/Hummer12007/brightnessctl)
        							riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +5%'
        							riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 5%-'
        						done

        						# Make all views with an app-id that starts with "float" and title "foo" start floating.
        						riverctl rule-add -app-id 'float*' -title 'foo' float
        						# Make all views with app-id "bar" and any title use client-side decorations
        						riverctl rule-add -app-id "bar" csd
                    riverctl rule-add ssd

        						rivertile -view-padding 3 -outer-padding 3 &

      '';
    };
  };
}
