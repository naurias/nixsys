{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./dunst.nix
    ./gui-apps.nix
    ./hyprland.nix
    ./river.nix
  ];

  #rofi-wayland
  programs.rofi = {
    enable = true;
  };
}
