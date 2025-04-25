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
    home-configurations.developemt.ides = {
      enable = lib.mkEnableOption {
        description = "Enables ides home manager configurations.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.home-configurations.developemt.ides.enable {

    nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

    programs.vscode = {
      enable = true;
      profiles.default = {
        enableUpdateCheck = false;
        userSettings = {
          "telemetry.telemetryLevel" = "off";
          "editor.formatOnSave" = true;
        };
        extensions = with pkgs.vscode-marketplace; [
          ms-vscode.vs-keybindings
          jnoortheen.nix-ide
        ];
      };
    };
  };
}
