{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = false;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Remove not needed GNOME packages.
  environment.gnome.excludePackages = with pkgs; [
    baobab      # disk usage analyzer
    cheese      # photo booth
    eog         # image viewer
    epiphany    # web browser
    #gedit       # text editor
    simple-scan # document scanner
    #totem       # video player
    yelp        # help viewer
    evince      # document viewer
    file-roller # archive manager
    geary       # email client
    #seahorse    # password manager
    hitori # sudoku game
    iagno # go game
    tali # poker game
    snapshot # camera

    #gnome-calculator 
    gnome-calendar 
    gnome-characters 
    #gnome-clocks 
    gnome-contacts
    gnome-font-viewer 
    #gnome-logs 
    gnome-maps 
    gnome-music 
    #gnome-photos 
    #gnome-screenshot
    #gnome-system-monitor 
    gnome-weather 
    #gnome-disk-utility 
    gnome-connections
    gnome-tour
    gnome-software
  ];

  # Add GNOME packages and shell extensions
  environment.systemPackages = with pkgs; [
    gnomeExtensions.app-hider
    gnomeExtensions.grand-theft-focus
    gnomeExtensions.appindicator
    gnomeExtensions.fullscreen-avoider

    gnome-tweaks
  ];
}