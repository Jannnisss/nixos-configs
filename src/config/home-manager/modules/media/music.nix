{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default  
  ];

  ehome.packages = with pkgs; [

  ];

  # Install spotify with customization.
  programs.spicetify = 
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
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
}