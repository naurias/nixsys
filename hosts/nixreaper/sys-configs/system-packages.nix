{
  pkgs,
  nur,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    htop
    brightnessctl
    wireguard-tools
    protonvpn-gui
    wlr-randr
    kanata
    sops 
    age 
    ssh-to-age
    compose2nix
  ];
  programs.nh = {
    enable = true;
    flake = "/home/nix/nixsys";
  };
}
