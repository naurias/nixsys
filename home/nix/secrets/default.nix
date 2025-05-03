{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.keyFile = "/home/nix/.config/sops/age/nix-key.txt";
    defaultSopsFile = ../../../secrets/secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private-keys/nix" = {
        path = "/home/nix/.ssh/id_ed25519";
      };
    };
  };
}
