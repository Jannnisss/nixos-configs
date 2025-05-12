{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    system-configurations.shared.services = {
      enablePrinting = lib.mkEnableOption {
        default = true;
        description = "Enables printing system configurations.";
      };
      enableTailscale = lib.mkEnableOption {
        default = false;
        description = "Enables Tailscale services.";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.system-configurations.shared.services.enablePrinting {
      # Enable CUPS to print documents.
      services.printing.enable = true;
    })
    (lib.mkIf config.system-configurations.shared.services.enableTailscale {
      # Enable Tailscale for VPN network connections.
      services.tailscale.enable = true;
    })
  ];
}
