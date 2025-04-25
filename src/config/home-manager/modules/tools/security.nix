{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    home-configurations.tools.security = {
      enable = lib.mkEnableOption {
        description = "Enables security apps home manager configurations.";
        default = false;
      };
    };
  };
  config = lib.mkIf config.home-configurations.tools.security.enable {
    home.packages = with pkgs; [
      veracrypt
      yubioath-flutter
    ];
  };
}
