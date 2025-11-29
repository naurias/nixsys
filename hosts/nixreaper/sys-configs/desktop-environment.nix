{
  config,
  libs,
  pkgs,
  inputs,
  ...
}: {
  #programs.hyprland = {
  #  enable = true;
  #  xwayland.enable = true;
  #};

  programs.niri = {
    enable = true;
  };
  #  programs.river = {
  #  enable = true;
  #  xwayland.enable = true;
  #};

  #programs.mango = {
  #  enable = true;
  #};
  environment.localBinInPath = true;

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
    ubuntu-sans
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    cascadia-code
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    #theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}
