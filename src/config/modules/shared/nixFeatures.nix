{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    system-configurations.shared.nixFeatures = {
      enable = lib.mkEnableOption {
        description = "Enables nix experimental features.";
        default = true;
      };
    };
  };

  config = lib.mkIf config.system-configurations.shared.nixFeatures.enable {
    # Enable experimental features
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };
    };
  };

}
