{ config, pkgs, inputs, ... }:

{
  imports = [
    # Import desktop enviroment configurations
    ./de/gnome.nix

    # Import tool apps
    ./tools/office.nix
    ./tools/browsers.nix
    ./tools/encryption.nix

    # Import social apps
    ./social/voicechat.nix

    # Import development apps
    ./development/ides.nix
    ./development/cli.nix

    # Import gaming apps
    ./gaming/launchers.nix
    ./gaming/modding.nix

    # Import media apps
    ./media/music.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}