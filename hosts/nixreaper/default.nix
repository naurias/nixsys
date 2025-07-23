{
  imports = [
    ../common
    ./configuration.nix
    ./services
    # ./secrets.nix
    # ./server.nix
  ];

  extraServices.docker.enable = true;
  extraServices.virtualisation.enable = false;
  extraServices.gaming.enable = true;
  flakedModules.stylix.enable = true;
}
