{
	config,
	lib,
	outputs,
	pkgs,
	...
}:

{
	imports = builtins.attrValues outputs.homeManagerModules;
	nixpkgs = {
		overlays = [
			# Add overlays here
			outputs.overlays.additions
			outputs.overlays.modifications
			outputs.overlays.stable-packages
			
			# overlays from other nix flakes can be added as well
			# neovim-nightly-overlay.overlay.default

			# Or define it inline, for example;
			# (final: prev: {
			#		hi = final.hello.overrideAttrs (oldAttrs: {
			#			patches = [ ./change-hello-to-hi.patch ];	
			#		});
			#	};)
		];
	
		# Configure nixpkgs instance
		config = {
			allowUnfree = true;
		  allowUnfreePredicate = _: true;
		};
	};

	nix = {
		package = lib.mkDefault pkgs.nix;
		settings = {
			experimental-features = ["nix-command" "flakes"];
			warn-dirty = false;
		};
	};




}
