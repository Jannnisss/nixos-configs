{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    system-configurations.shared.networking = {
      enable = lib.mkEnableOption {
        description = "Enables networking system configurations.";
        default = true;
      };
      hostName = lib.mkOption {
        type = lib.types.str;
        default = "nixos";
        description = "Sets the hostname of the system.";
      };
    };
  };

  config = lib.mkIf config.system-configurations.shared.networking.enable {
    # Define hostname.
    networking.hostName = config.system-configurations.shared.networking.hostName;

    # Enable networking.
    networking.networkmanager.enable = true;
  };
}
