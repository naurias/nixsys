
# These are settings for zsh for home user for the host this will be for

# host configuration within user space

{
	config,
	lib,
	pkgs,
	...
}:


	with lib; let 
	cfg = config.features.cli.zsh ;

						in 
{
	options.features.cli.zsh.enable = mkEnableOption "enable extended zsh configurations";

	# if statement
	
	# even though zsh is enabled in main config enabliing it here as well so that it can be used by home/nix/nixreaper.nix custom options it also check if that is enable in main config or not if it does then applies following options

	config = mkIf cfg.enable {
		programs.zsh = {
			enable = true;
			enableCompletion = true;
			syntaxHighlighting.enable = true;
			autosuggestion.enable = true;
			plugins = [
				{
					name = "fzf-tab";
					src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
				}
			];
			# add source /run/agenix/${config.home.username}-secrets in initextra for secrets
			initContent = ''

				export NIX_PATH="nixpkgs=channel:nixos-unstable"
        export NIX_LOG=info

# Keybinding
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#Alias
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/second.toml)"


			'';
		};
		# can add zshrc later as home file 
	};

	
}

