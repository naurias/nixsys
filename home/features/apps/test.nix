{
  config,
  lib,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    python313Packages.qiskit-ignis
    dart-sass
  ];
}
