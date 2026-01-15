{
  config,
  libs,
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config = {
      common = {
        default = [
          "gtk"
          "wlr"
        ];
      };
      niri = {
        default = [
          "gtk"
          "wlr"
          "gnome"
        ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
      };
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        #        "org.freedesktop.impl.portal.OpenURI" = [ "gtk" ];
      };
    };

  };
  #  programs.river = {
  #  enable = true;
  #  xwayland.enable = true;
  #};

  environment.localBinInPath = true;

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
    ubuntu-sans
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    cascadia-code
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    #theme = "catppuccin-mocha";
    package = pkgs.kdePackages.sddm;
  };
}
