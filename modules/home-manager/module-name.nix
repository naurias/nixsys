{
	config,
	lib,
	pkgs,
	...
}:

with lib; let
	cfg = config.programs.module-name.ni;
in {
	
	options = {
		programs.pkg-name = { # this is package from pkgs/mypackages
			enable = mkEnableOption "description for package in root-flake/pkgs";
			projectFolders = lib.mkOption {
				type = lib.types.listOf lib.types.path;
				description = "list of config files for my-pkg";
				default = [
					"${config.home.homeDirectory}/projects"
				];
				
				latout = lib.mkOption {
					type = lib.types.str;
					description = " layout for my-pkg ";
					default = ''
						layout {
							blah blah config file
						}
					'';
				};

			};
		};
	};
	config = mkIf cfg.enable {
		home.packages = [ pkgs.my-pkg ];
		home.sessionVariables.PROJECT_FOLDERS = lib.concatStringsSep ";" cfg.projectFolders;
		home.file.".config/pkg-config-folder/".text = cfg.layout;
	}:

}
