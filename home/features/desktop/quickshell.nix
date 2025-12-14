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
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.dankMaterialShell.packages.${pkgs.stdenv.hostPlatform.system}.default
    quickshell
  ];

  home.file = {
    ".config/noctalia" = {
      source = "${inputs.dotfiles}/noctalia";
      recursive = true;
    };
    ".config/DankMaterialShell" = {
      source = "${inputs.dotfiles}/DankMaterialShell";
      recursive = true;
    };
  };

  #programs.dankMaterialShell = {
  #  enable = false;
  #};

  #programs.noctalia-shell = {
  #  enable = false;
  #};
}
