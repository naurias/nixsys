{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./dunst.nix
    ./hyprland.nix
    ./river.nix
    ./mango.nix
    ./niri.nix
    ./waybar.nix
    ./quickshell.nix
  ];

  #rofi-wayland
  programs.rofi = {
    enable = true;
  };
}
