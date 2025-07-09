{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.virtualisation;
in {
  options.extraServices.virtualisation.enable = mkEnableOption "enabling virtaul machines systemwide";

  config = mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
    programs.virt-manager.enable = true;
    environment = {
      systemPackages = [pkgs.qemu];
    };
  };
}
