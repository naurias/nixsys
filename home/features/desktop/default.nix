{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./dunst.nix
    ./hyprland.nix
    ./river.nix
    ./mango.nix
    ./niri.nix
    ./waybar.nix
    ./noctalia.nix
    ./dank.nix
  ];

  #rofi-wayland
  programs.rofi = {
    enable = true;
  };
}
