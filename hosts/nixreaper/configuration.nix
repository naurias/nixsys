{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./sys-configs
  ];

  networking.hostId = "8425e349";
  networking.hostName = "nixreaper"; # Define your hostname.
  # Network Manager
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    #   useXkbConfig = true; # use xkb.options in tty.
  };

  # Configure keymap in X11
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us,graphite";
  services.xserver.xkb.variant = ",";
  services.xserver.xkb.options = "grp:alt_shift_toggle";
  services.xserver.xkb.extraLayouts = {
    graphite = {
      description = "Graphite layout";
      languages = ["eng"];
      symbolsFile = ./graphite.xkb;
    };
  };
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Shell settings are defined in home/feature/cli
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?
}
