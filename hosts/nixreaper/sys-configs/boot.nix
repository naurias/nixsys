{
	config,
	lib,
	pkgs,
	...
}:

{
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot";
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
		};
	};

	boot.supportedFilesystems = [
		"ntfs"
		"btrfs"
	];

}
