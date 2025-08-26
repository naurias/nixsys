{
  config,
  libs,
  pkgs,
  ...
}: {
  programs.river = {
    enable = true;
    xwayland.enable = true;
  };
  #  programs.hyprland = {
  #  enable = true;
  #  xwayland.enable = true;
  #};
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  environment.localBinInPath = true;

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
    ubuntu-sans
    nerd-fonts.symbols-only
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    #theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}
