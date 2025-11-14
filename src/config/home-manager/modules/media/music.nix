{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  options = {
    home-configurations.media.music = {
      enable = lib.mkEnableOption {
        description = "Enables music apps home manager configurations.";
        default = false;
      };
    };
  };

  config = lib.mkIf config.home-configurations.media.music.enable {
    # Install spotify with customization.
    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.systems};
      in
      {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          shuffle
        ];
        enabledCustomApps = with spicePkgs.apps; [
          newReleases
          marketplace
        ];
        enabledSnippets = with spicePkgs.snippets; [
          smoothProgressBar
          autoHideFriends
          hideSidebarScrollbar
          hideMiniPlayerButton
          hideNowPlayingViewButton
        ];

        theme = spicePkgs.themes.sleek;
        colorScheme = "Nord";
      };
  };
}
