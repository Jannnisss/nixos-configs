{ config, pkgs, inputs, nixpkgs, ... }:

{

  home.packages = with pkgs; [

  ];

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
} 