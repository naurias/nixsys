{
  config,
  lib,
  pkgs,
  ...
}:

{

  hardware.uinput.enable = true;
    # Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
            w caps lsft henkan muhenkan ralt a s d f j k l ;
          )
          (defvar
            tap-time 250
            hold-time 250
          )

          (defalias
            nav-mod (tap-hold 200 200 w (layer-while-held nav))
            a (multi f24 (tap-hold $tap-time $hold-time a lmet))
            s (multi f24 (tap-hold $tap-time $hold-time s lalt))
            d (multi f24 (tap-hold $tap-time $hold-time d lsft))
            f (multi f24 (tap-hold $tap-time $hold-time f lctl))
            j (multi f24 (tap-hold $tap-time $hold-time j rctl))
            k (multi f24 (tap-hold $tap-time $hold-time k rsft))
            l (multi f24 (tap-hold $tap-time $hold-time l ralt))
            ; (multi f24 (tap-hold $tap-time $hold-time ; rmet))
          )

          (deflayer base
            @nav-mod esc bspc bspc bspc bspc @a @s @d @f @j @k @l @;
          )

          (deflayer nav
           _ _ _ _ _ _ _ _ _ _ left down up right
          )
        '';
      };
    };
  };
}
