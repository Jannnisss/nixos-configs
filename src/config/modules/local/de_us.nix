{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    system-configurations.local.de_us = {
      enable = lib.mkEnableOption {
        description = "Enables de_us system localization.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.system-configurations.local.de_us.enable {
    # Set your time zone.
    time.timeZone = "Europe/Berlin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "de";
      variant = "us";
    };

    # Configure console keymap
    console.keyMap = "de";
  };
}
