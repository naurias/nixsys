{
	config,
	pkgs,
	lib,
	...
}:

with lib; let
	cfg = config.features.desktop.fonts;
in 

{
	options.features.desktop.fonts.enable = mkEnableOption "install fonts for desktop";

	config = mkIf cfg.enable {
		home.packages = with pkgs; [
			nerd-fonts.fira-code
			font-manager
			font-awesome_5
			noto-fonts
		];
	};
}
