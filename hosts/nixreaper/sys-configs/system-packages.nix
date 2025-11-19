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
    age 
    ssh-to-age
    compose2nix
  ];
  programs.nh = {
    enable = true;
    flake = "/home/nix/nixsys";
  };
}
