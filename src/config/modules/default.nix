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
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
