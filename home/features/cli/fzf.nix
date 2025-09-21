{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.cli.fzf;
in {
  options.features.cli.fzf.enable = mkEnableOption "enable fuzzy finder";

		# check if it's enabled in home/nix/nixreaper.nix then apply following setting

 config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions = [
        "--preview='bat --color=always -n {}'"
        "--bind 'ctrl-/:toggle-preview'"
      ];
      defaultCommand = "fd --type f --exclude .git --follow --hidden";
      changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
    };
    home.file = {
      ".config/fzftab" = {
        source = "${inputs.dotfiles}/fzftab";
        recursive = true;
      };
    };
  };
}
