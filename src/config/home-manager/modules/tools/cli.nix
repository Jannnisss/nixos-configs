{
  config,
  pkgs,
  inputs,
  nixpkgs,
  lib,
  ...
}:

{
  options = {
    home-configurations.tools.cli = {
      enable = lib.mkEnableOption {
        description = "Enables cli tools home manager configurations.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.home-configurations.tools.cli.enable {
    home.packages = with pkgs; [
      tree
      appimage-run
    ];
  };
}
