{
  imports = [
    ../common
    ./configuration.nix
    ./services
    # ./secrets.nix
  ];

  extraServices.podman.enable = true;
  extraServices.gaming.enable = true;
  flakedModules.snowvim.enable = true;
  flakedModules.stylix.enable = true;
}
