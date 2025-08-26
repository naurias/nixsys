{pkgs, ...}: {
  imports = [
    ./river.nix
    ./yambar.nix
    ./fonts.nix
    ./dunst.nix
    ./gui-apps.nix
    ./hyprland.nix
    ./niri.nix
  ];

  #rofi-wayland
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}
