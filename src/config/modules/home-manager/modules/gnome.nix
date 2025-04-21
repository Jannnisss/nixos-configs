{ config, pkgs, inputs, ... }:

{
  dconf.settings = {
  # To place minimize, maximize, and close buttons on the right (default order):
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    # Set theme to dark.
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita-dark";
    };
    # Disable mouse acceleration.
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };
  };
}