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
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.system-configurations.shared.services.enablePrinting {
      # Enable CUPS to print documents.
      services.printing.enable = true;
    })
  ];
}
