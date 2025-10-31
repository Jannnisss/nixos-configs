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
      autoupdate = {
        enable = lib.mkEnableOption {
          description = "Enables nixos update script.";
          default = false;
        };
        flakePath = lib.mkOption {
          type = lib.types.str;
          description = "Full local path to the git repository.";
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
          repoPath=${config.system-configurations.shared.services.autoupdate.flakePath}
          gitDirs=$(git config --global --get-all safe.directory || true)
          if ! echo "$gitDirs" | grep -qx "$repoPath"; then
            git config --global --add safe.directory "$repoPath"
          fi
          cd $repoPath/src/config
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
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        timerConfig = {
          OnCalendar = "05:00";
          Persistent = true;
        };
      };
    })
  ];
}
