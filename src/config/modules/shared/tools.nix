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
    system-configurations.shared.tools = {
      enableGit = lib.mkEnableOption {
        description = "Enables git configuration.";
        default = true;
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.system-configurations.shared.tools.enableGit {
      environment.systemPackages = with pkgs; [
        git
      ];
    })
  ];
}
