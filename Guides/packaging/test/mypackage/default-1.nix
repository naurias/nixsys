{
	pkgs ? import <nixpkgs> {}
};


pkgs.stdenv.mkDerivation {
	name = "packagename";
	version = "packageversion";
	src = ./.;
	# fo dependencies
	buildInputs = [];
	installPhase = '' 
		mkdir -p $out/bin
		cp myscript.sh $out/bin/myscript.sh
		chmod +x $out/bin/myscript.sh
	'';

# build witth  
# nix-build 

}
