{
  imports = [
    ../common
    ./configuration.nix
  ];

  extraServices.docker.enable = true;
  extraServices.virtualisation.enable = false;
  extraServices.gaming.enable = true;
  extraServices.flatpak.enable = true;
  extraServices.vpn.enable = true;
  flakedModules.stylix.enable = true;
}
