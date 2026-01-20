{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.variables = {
    EDITOR = "nvim";
    SSH_AUTH_SOCK= "/home/nix/.bitwarden-ssh-agent.sock";
  };
}
