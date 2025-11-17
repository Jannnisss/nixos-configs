{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    home-configurations.media.pictures = {
      enable = lib.mkEnableOption {
        description = "Enables picture media applications.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.home-configurations.gaming.launchers.enable {
    home.packages = with pkgs; [
      ente-desktop
    ];
  };
}
