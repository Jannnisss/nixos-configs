{ config, pkgs, ... }:

{
  imports =
  [
    # Define Desktop enviroment
    ./de/gnome.nix

    # Define locale settings
    ./local/de_us.nix

    # Define development apps
    ./development/cli.nix

    # Define gaming apps
    ./gaming/steam.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}