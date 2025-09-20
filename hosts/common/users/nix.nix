{
	config,
	pkgs,
	inputs,
	...
}:

{


	users.users.nix = {
		isNormalUser = true;
		description = "Nauman Ahmad";
		extraGroups = [
			"wheel"
			"networkmanager"
			"libvirtd"
			"audio"
			"video"
      "podman"
			"qemu-libvirtd"
      "docker"
			"kvm"
			"input"
			"flatpak"
			"plugdev"
		];
		packages = [inputs.home-manager.packages.${pkgs.system}.default];
	};
	home-manager.users.nix = 
		import ../../../home/nix/${config.networking.hostName}.nix;

  home-manager.backupFileExtension = "hm-backup";
}
