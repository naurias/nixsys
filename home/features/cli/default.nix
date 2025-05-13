
# this whole nix file is common and then can be imported for user who want to install these packages and configs in user of home/nix and host of home/nix/nixreaper.nix 
# these will be installed in home settings not system wide

{
	pkgs,
	...
}:

{
	
	# these imports are basically features to be enabled as per home/nix/nixreaper.nix
	
	imports = [
		./zsh.nix
		./fzf.nix
	];

	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		};

	programs.eza = {
		enable = true;
		enableZshIntegration = false;
	};
	programs.bat = {
		enable = true;
	};
	
	home.packages = with pkgs; [
		coreutils
    unzip
		oh-my-posh
    exiftool
		zsh-fzf-tab
		fd
    wl-clipboard
    peazip
    _7zz
		ffmpeg
		ffmpegthumbnailer
		poppler
		htop
		fastfetch
		httpie
		jq
    cryfs
		procs
		ripgrep
		tldr
		zip
	];
  # ghostty
  programs.ghostty = {
    enable = true;
  };

}
