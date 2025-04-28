{
  config,
  pkgs,
  lib,
  ...
}:

{

  options = {
    system-configurations.dm.gdm = {
      enable = lib.mkEnableOption {
        description = "Enables GNOME display manager desktop enviroment.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.system-configurations.dm.gdm.enable {

    # Enable the GNOME display manager.
    services.xserver.displayManager.gdm.enable = true;

    # Enable auto suspend on login screen.
    services.xserver.displayManager.gdm.autoSuspend = true;

    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;
  };
}
