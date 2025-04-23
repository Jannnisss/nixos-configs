{ config, pkgs, inputs, ... }:

{
  imports = [
    # Define desktop enviroment
    ./de/gnome.nix

    # Define tool apps
    ./tools/office.nix
    ./tools/browsers.nix
    ./tools/encryption.nix

    # Define social apps
    ./social/voicechat.nix

    # Define development apps
    ./development/ides.nix

    # Define gaming apps
    ./gaming/launchers.nix
    ./gaming/modding.nix

    # Define media apps
    ./media/music.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}