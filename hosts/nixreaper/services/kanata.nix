{
  config,
  lib,
  pkgs,
  ...
}: {

  #    boot.kernelModules = [ "uinput" ];
  #  hardware.uinput.enable = true;
  #  services.udev.extraRules = ''
#    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  #  '';
  #  users.groups.uinput = { };
  # systemd.services.kanata-internalKeyboard.serviceConfig = {
  #    SupplementaryGroups = [
  #     "input"
  #     "uinput"
  #   ];
  # };

  #services.kanata = {
  #  enable = true;
  #  keyboards = {
  #    internalKeyboard = {
  #             devices = [
  #                "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
  #                "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd"
  #                "/dev/input/by-path/pci-0000:00:14.0-usb-0:4:1.0-event-kbd"
  #                "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:1:1.0-event-kbd"
  #                "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:4:1.0-event-kbd"
  #              ];
  #      extraDefCfg = "process-unmapped-keys yes";
  #      config = ''
  #                (defsrc
  #                  caps lsft henkan muhenkan ralt a s d f j k l ;
  #                )
  #                (defvar
  #                 tap-time 250
  #                 hold-time 250
  #                )
  #                (defalias
  #                  a (multi f24 (tap-hold $tap-time $hold-time a lmet))
  #                  s (multi f24 (tap-hold $tap-time $hold-time s lalt))
  #                  d (multi f24 (tap-hold $tap-time $hold-time d lsft))
  #                  f (multi f24 (tap-hold $tap-time $hold-time f lctl))
  #                  j (multi f24 (tap-hold $tap-time $hold-time j rctl))
  #                  k (multi f24 (tap-hold $tap-time $hold-time k rsft))
  #                  l (multi f24 (tap-hold $tap-time $hold-time l ralt))
  #                  ; (multi f24 (tap-hold $tap-time $hold-time ; rmet))
  #                )
  #
  #               (deflayer base
  #                 esc bspc bspc bspc bspc @a @s @d @f @j @k @l @;
  #               )
  #     '';
  #   };
  # };
  #};
}
