{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./dunst.nix
    ./hyprland.nix
    ./river.nix
  ];

  #rofi-wayland
  programs.rofi = {
    enable = true;
  };
}
