{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    system-configurations.shared.usbmuxd = {
      enable = lib.mkEnableOption {
        description = "Enables usbmuxd configurations.";
        default = true;
      };
    };
  };

  config = lib.mkIf config.system-configurations.shared.usbmuxd.enable {
    services.usbmuxd.enable = true;

    environment.systemPackages = with pkgs; [
      libimobiledevice
      ifuse # optional, to mount using 'ifuse'
    ];

  };
}
