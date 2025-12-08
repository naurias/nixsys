{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];
  programs.zen-browser = {
    enable = true;
    profiles = {
      nix = {
        isDefault = true;
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            single-file
            keepassxc-browser
            proton-vpn
            karakeep
            aria2-integration
          ];
        };
      };
    };
  };

}
