{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./../../modules/default.nix
  ];

  home-configurations = {
    developemt.cli.enable = true;
    developemt.ides.enable = true;

    gaming.launchers.enable = true;
    gaming.modding.enable = true;

    media.music.enable = true;

    social.voicechat.enable = true;

    tools.browsers = {
      enable = true;
      enableExtraBrowsers = true;
    };
    tools.security.enable = true;
    tools.office.enable = true;
    tools.cli.enable = true;
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
