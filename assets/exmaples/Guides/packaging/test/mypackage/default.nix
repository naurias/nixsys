{
	stdenv
}:

stdenv.mkDerivation {
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
# nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}';
# the script is located in same folder (just simple script no unpackagin building phases or so) 
# if we don't want to use such nix-build then package would be as followin in default-1.nix
}
