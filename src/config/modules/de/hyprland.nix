{
  config,
  pkgs,
  lib,
  ...
}:

{

  options = {
    system-configurations.de.hyprland = {
      enable = lib.mkEnableOption {
        description = "Enables Hyprland desktop enviroment.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.system-configurations.de.hyprland.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = false;

    # enable Hyprland
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    # Add GNOME packages and shell extensions
    environment.systemPackages = with pkgs; [
      kitty
      hyprpaper
      waybar
      wofi
      mako
    ];
  };
}
