{
	config,
	lib,
	pkgs,
	...
}:

{

	services.udisks2.enable = true;
  services.resolved.enable = false;
	services.gvfs.enable = true;

}
