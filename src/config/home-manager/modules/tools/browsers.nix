{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    inputs.betterfox-nix.homeManagerModules.betterfox
  ];

  options = {
    home-configurations.tools.browsers = {
      enable = lib.mkEnableOption {
        description = "Enables browser apps home manager configurations.";
        default = true;
      };
      enableExtraBrowsers = lib.mkEnableOption {
        description = "Enables extra browser apps home manager configurations.";
        default = false;
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.home-configurations.tools.browsers.enable {
      # Installs firefox with betterfox
      programs.firefox = {
        enable = true;
        profiles.default = {
          search = {
            force = true;
            default = "Startpage";
            engines = {
              "Startpage" = {
                urls = [
                  {
                    template = "https://www.startpage.com/rvd/search?query={searchTerms}&language=auto";
                  }
                ];
                icon = "https://www.startpage.com/sp/cdn/favicons/mobile/android-icon-192x192.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@startpage" ];
              };
            };
          };
          betterfox = {
            enable = true;
            enableAllSections = true;
          };
          settings = {
            "browser.aboutConfig.showWarning" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          };
        };
        policies = {
          ExtensionSettings = {
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            "gdpr@cavi.au.dk" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
              installation_mode = "force_installed";
            };
            "@contain-facebook" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/facebook-container/latest.xpi";
              installation_mode = "force_installed";
            };
            "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
              installation_mode = "force_installed";
            };
            "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
              installation_mode = "force_installed";
            };
            "sponsorBlocker@ajay.app" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
              installation_mode = "force_installed";
            };
            "{9a3104a2-02c2-464c-b069-82344e5ed4ec}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-no-translation/latest.xpi";
              installation_mode = "force_installed";
            };
          };
        };
      };
    })

    (lib.mkIf
      (
        config.home-configurations.tools.browsers.enable
        && config.home-configurations.tools.browsers.enableExtraBrowsers
      )
      {
        home.packages = with pkgs; [
          ungoogled-chromium
          tor-browser
        ];
      }
    )
  ];

}
