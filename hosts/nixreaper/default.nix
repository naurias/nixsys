{
  imports = [
    ../common
    ./configuration.nix
    ./services
    # ./secrets.nix
    # ./server.nix
  ];

  extraServices.podman.enable = true;
  extraServices.virtualisation.enable = true;
  extraServices.gaming.enable = true;
  flakedModules.snowvim.enable = true;
  flakedModules.stylix.enable = true;
}
