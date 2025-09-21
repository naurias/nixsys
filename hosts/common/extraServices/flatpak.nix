{
	config,
	lib,
	pkgs,
	...
}:

with lib; let
	cfg = config.extraServices.flatpak;
in

{

	options.extraServices.flatpak.enable = mkEnableOption "Enable flatpak";

	config = mkIf cfg.enable {
    services.flatpak.enable = true;
	};

}
