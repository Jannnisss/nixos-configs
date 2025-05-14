{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    system-configurations.shared.services = {
      enablePrinting = lib.mkEnableOption {
        default = true;
        description = "Enables printing system configurations.";
      };
      enableTailscale = lib.mkEnableOption {
        default = false;
        description = "Enables Tailscale services.";
      };
      # Needs /root/.gitconfig when using user owned repository
      # [safe]
      # directory = /home/jannis/Documents/Repos/nixos-configs
      autoupdate = {
        enable = lib.mkEnableOption {
          description = "Enables nixos update script.";
          default = false;
        };
        flakePath = lib.mkOption {
          type = lib.types.str;
          description = "Full local path to the flake.";
          example = "/etc/nixos";
        };
        configName = lib.mkOption {
          type = lib.types.str;
          description = "The name of the nixos configuration inside the flake.";
          example = "gamingpc";
        };
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf config.system-configurations.shared.services.enablePrinting {
      # Enable CUPS to print documents.
      services.printing.enable = true;
    })
    (lib.mkIf config.system-configurations.shared.services.enableTailscale {
      # Enable Tailscale for VPN network connections.
      services.tailscale.enable = true;
    })
    (lib.mkIf config.system-configurations.shared.services.autoupdate.enable {
      systemd.services.auto-update-flake = {
        script = ''
          set -e
          cd ${config.system-configurations.shared.services.autoupdate.flakePath}
          git pull
          nixos-rebuild switch --flake .#${config.system-configurations.shared.services.autoupdate.configName}
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          Environment = [
            "PATH=/run/current-system/sw/bin"
          ];

        };
      };

      systemd.timers.auto-update-flake = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "daily 05:00";
          Persistent = true;
        };
      };
    })
  ];
}
