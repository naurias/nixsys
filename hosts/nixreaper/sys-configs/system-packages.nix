{
  pkgs,
  nur,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    brightnessctl
    wireguard-tools
    wlr-randr
    kanata
    sops
    xdg-desktop-portal-gnome
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    xdg-desktop-portal
    age 
    ssh-to-age
    compose2nix
  ];
  programs.nh = {
    enable = true;
    flake = "/home/nix/nixsys";
  };
}
