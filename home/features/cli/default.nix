{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./posh.nix
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
}
