{
	pkgs,
	...
}:

{
	imports = [
    #		./wayland.nix
		./river.nix
    ./yambar.nix
		./fonts.nix
		./dunst.nix
		./gui-apps.nix
    ./niri.nix
	];
	home.packages = with pkgs; [
		brave
		keepassxc
		git-credential-keepassxc
	];

  #rofi-wayland
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

}
