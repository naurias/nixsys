{
	inputs,
	...
}:

{

#	imports = [
#		./bar.nix
#	];

	home.file = {
      #	".config/kitty" = {
      #	source = "${inputs.dotfiles}/kitty";
      #	recursive = true;
      #};
		".config/fzftab" = { 
			source = "${inputs.dotfiles}/fzftab";
			recursive = true;
		};
		".config/ohmyposh" = {
			source = "${inputs.dotfiles}/ohmyposh";
			recursive = true;
		};

	};

}
