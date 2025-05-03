{
	config,
	lib,
	pkgs,
	...
}:

with lib; let
	cfg = config.extraServices.gaming;
in

{

	options.extraServices.gaming.enable = mkEnableOption "enabling opengl and graphic options systemwide";

	config = mkIf cfg.enable {
		hardware.graphics = {
			enable = true;
			enable32Bit = true;
		};
		programs.steam.enable = true;
		programs.steam.gamescopeSession.enable = true;
		programs.gamemode.enable = true;
		environment.sessionVariables = {
			STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/nix/.steam/root/compatibilitytools.d";
		};
		environment.systemPackages = with pkgs; [
			protonup
			steam-run
			wineWowPackages.stagingFull
			lutris
		];
	};

}
