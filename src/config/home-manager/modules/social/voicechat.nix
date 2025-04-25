{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    home-configurations.social.voicechat = {
      enable = lib.mkEnableOption {
        description = "Enables social apps home manager configurations.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.home-configurations.social.voicechat.enable {
    home.packages = with pkgs; [
      vesktop
    ];
  };
}
