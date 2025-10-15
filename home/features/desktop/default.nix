{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./dunst.nix
    ./hyprland.nix
    ./river.nix
    ./mango.nix
  ];

  #rofi-wayland
  programs.rofi = {
    enable = true;
  };
}
