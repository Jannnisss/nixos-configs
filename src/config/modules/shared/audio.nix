{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  options = {
    system-configurations.shared.audio = {
      enable = lib.mkEnableOption {
        description = "Enables audio system configurations.";
        default = true;
      };
    };
  };

  config = lib.mkIf config.system-configurations.shared.audio.enable {
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      wireplumber.enable = true;
    };
  };
}
