{ pkgs, inputs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];
  home.packages = with pkgs; [
    cava
    cliphist
    kdePackages.qtmultimedia
  ];
  programs.dankMaterialShell = {
    enable = true;
  };
}
