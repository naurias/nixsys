{ pkgs, inputs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.noctalia.homeModules.default
  ];
  home.packages = with pkgs; [
    cava
    cliphist
    kdePackages.qtmultimedia
  ];
  programs.dankMaterialShell = {
    enable = true;
  };

  programs.noctalia-shell = {
    enable = false;
  };
}
