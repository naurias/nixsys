{
	config,
	lib,
	pkgs,
	...
}:
	with lib; let
		cfg = config.features.desktop.yambar;
		bg_default = {
			stack = [
				{ background = { color = "81A1C1ff"; }; }
				{ underline = { size = 4; color = "D8DEE9ff"; }; }
			];
		};

		river_base = {
			left-margin = 10;
			right-margin = 13;
			default = { string = { text = ""; }; };
			conditions = {
				"id == 1" = { string = { text = "1"; }; };
				"id == 2" = { string = { text = "2"; }; };
				"id == 3" = { string = { text = "3"; }; };
				"id == 4" = { string = { text = "4"; }; };
				"id == 5" = { string = { text = "5"; }; };
			};
		};

	in
	{
		options.features.desktop.yambar.enable = mkEnableOption "wayland dotfiles and tools";
		config = mkIf cfg.enable {
			programs.yambar = {
				enable = true;
				settings = {
					bar = {
						height = 28;
						location = "top";
						background = "1e1e1eff";
						font = "NotoSans:pixelsize=16";
						right = [
							{
								clock = {
									content = [
										{ string = { text = ""; font = "Font Awesome 6 Free:style=solid:size=12"; }; }
										{ string = { text = "{date}"; right-margin = 5; }; }
										{ string = { text = ""; font = "Font Awesome 6 Free:style=solid:size=12"; }; }
										{ string = { text = "{time}   "; }; }
									];
								};
							}
						];
						left = [
							{
								river = {
									anchors = [ river_base ];
									content = {
										map = {
											on-click = {
												left = "sh -c \"riverctl set-focused-tags $((1 << ({id} - 1)))\"";
												right = "sh -c \"riverctl toggle-focused-tags $((1 << ({id} -1)))\"";
												middle = "sh -c \"riverctl toggle-view-tags $((1 << ({id} -1)))\"";
											};
										conditions = {
											"state == urgent" = { map = lib.recursiveUpdate river_base { deco = { background = { color = "D08770ff"; }; }; }; };
											"state == focused" = { map = lib.recursiveUpdate river_base { deco = bg_default; }; };
											"state == visible && ~occupied" = { map = river_base; };
											"state == visible && occupied" = { map = lib.recursiveUpdate river_base { deco = bg_default; }; };
											"state == unfocused" = { map = river_base; };
											"state == invisible && ~occupied" = { empty = {}; };
											"state == invisible && occupied" = { map = lib.recursiveUpdate river_base { deco = { underline = { size = 3; color = "ea6962ff"; }; }; }; };
										};
									};
								};
							};
						}
						];
						center = [
							{
								foreign-toplevel = {
									content = {
										map = {
											conditions = {
												"~activated" = { empty = {}; };
												"activated" = [
													{ string = { text = "   {app-id}"; foreground = "ffa0a0ff"; }; }
													{ string = { text = ": {title}"; }; }
												];
											};
										};
									};
								};
							}
						];
					};
				};
			};
		};
	}
