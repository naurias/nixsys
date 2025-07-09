{
	config,
	lib,
	pkgs,
	...
}:

{

	services.udisks2.enable = true;
  services.resolved.enable = true;
	services.gvfs.enable = true;

}
