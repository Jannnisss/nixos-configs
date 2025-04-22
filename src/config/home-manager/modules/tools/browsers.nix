{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    ungoogled-chromium
    tor
  ];

  # Install LibreWolf.
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableDataSubmission = true;
      DisableCrashReports = true;
      DisableSafeBrowsing = true;
      DefaultSearchEngine = "Startpage";
      SearchBar = "unified";
      Homepage = {
        StartPage = "blank";
        URL = "about:blank";
      };
      Preferences = {
        #"privacy.resistFingerprinting" = false;
      };
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

  # Set librewolf as default browser
  xdg.mimeApps = {
    enable = true;
    # Set LibreWolf as the default for common web protocols/types
    defaultApplications = {
      "text/html" = [ "librewolf.desktop" ];
      "x-scheme-handler/http" = [ "librewolf.desktop" ];
      "x-scheme-handler/https" = [ "librewolf.desktop" ];
      "x-scheme-handler/about" = [ "librewolf.desktop" ]; # Optional, for about: links
    };
  };
}