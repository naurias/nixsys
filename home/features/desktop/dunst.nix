{
	config,
	lib,
	pkgs,
	...
}:

with lib; let
	cfg = config.features.desktop.dunst;
in
{
	options.features.desktop.dunst.enable = mkEnableOption "Enabling dunst";

	config = mkIf cfg.enable {
		services.dunst = {
			enable = true;
			settings = {
				global = {
					width = 300;
					height = 300;
					origin = "top-right";
					offset = "30x50";
					transparency = 0;
					follow = "mouse";
					progress_bar = "true";
					progress_bar_height = 10;
					progress_bar_frame_width = 1;
					progress_bar_min_width = 150;
					progress_bar_max_width = 300;
          #frame_color = "#1e222a";
					sort = "yes";
				};
        #urgency_low = {
          #background = "#12151d";
          #foreground = "#abb2bf";
          #timeout = 10;
          #};
        #urgency_normal = {
          #background = "#12151d";
          #foreground = "#abb2bf";
          #	timeout = 10;
          #};
        #				urgency_critical = {
        #	background = "#12151d";
        #	foreground = "#e06c75";
        #	frame_color = "#e06c75";
        #	timeout = 0;
        #};
			};

		};
	};
}


