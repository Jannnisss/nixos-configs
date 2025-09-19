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
      general = {
        enable = lib.mkEnableOption {
          description = "Enables security apps home manager configurations.";
          default = false;
        };
      };
      passwordmanager = {
        enable = lib.mkEnableOption {
          description = "Enables passwordmanager app home manager configurations.";
          default = false;
        };
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.home-configurations.tools.security.general.enable {
      home.packages = with pkgs; [
        veracrypt
        yubioath-flutter
      ];
    })
    (lib.mkIf config.home-configurations.tools.security.passwordmanager.enable {
      home.packages = with pkgs; [
        proton-pass
      ];
    })
  ];
}
