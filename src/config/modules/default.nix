{
  config,
  pkgs,
  ...
}:

{
  imports = [
    # Import Desktop enviroments
    ./de/gnome.nix

    # Import locale settings
    ./local/de_us.nix

    # Import gaming apps
    ./gaming/steam.nix

    # Import shared modules
    ./shared/audio.nix
    ./shared/bootloader.nix
    ./shared/networking.nix
    ./shared/nixFeatures.nix
    ./shared/services.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
