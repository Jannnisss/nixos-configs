{ config, pkgs, inputs, lib, ... }:

{
  dconf.settings = {
"org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = "disabled";
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "fullscreen-avoider@noobsai.github.com"
        "grand-theft-focus@zalckos.github.com"
        "app-hider@lynith.dev"
      ];
      favorite-apps = [
        "librewolf.desktop"
        "steam.desktop"
        "vesktop.desktop"
        "spotify.desktop"
        "nautilus.desktop"
        ];
    };
    # Enable dynamic workspaces.
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
    # Place minimize, maximize, and close buttons on the right (default order):
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    # Set theme to dark.
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita-dark";
    };
    # Disable mouse acceleration, set mouse speed and disable natural scroll.
    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
      accel-profile = "flat";
      speed = 0.0;
    };
    # Disable inactivity sleep.
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };
    # Show hidden files.
    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };
    # Disable idle delay.
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 0;
    };
    # Disable hot corners.
    "org/gnome/desktop/interface" = {
      clock-format = "24h";
      enable-hot-corners = false;
    };
  };
}