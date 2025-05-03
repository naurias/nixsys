{
	cowsay, # dependencies need to be as arguments as well
	stdenv,
	ponysay,
	lib,
	makeWrapper, # to wrap out script without it cowsay would only be available in buildPhase not as runtime
}:

stdenv.mkDerivation {
	name = "packagename";
	# use pname which is recomendded 
	version = "packageversion";
	src = ./.;
	# fo dependencies
	buildInputs = [
		mkWrapper
	];
	installPhase = '' 
		mkdir -p $out/bin
		cp myscript.sh $out/bin/myscript.sh
		chmod +x $out/bin/myscript.sh
		${cowsay}/bin/cowsay "Hello Buildinputs i.e currently only working in buildinputs will not work in this example since not mentioned in buildinputs so simple delete this linet "
		wrapProgram $out/bin/myscript.sh \
						--prefix PATH : ${lib.mkBinPath [cowsay ponysay]}
	'';

# build witth  
# nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}';
# the script is located in same folder (just simple script no unpackagin building phases or so) 
# if we don't want to use such nix-build then package would be as followin in default-1.nix
}
