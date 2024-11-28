{ lib, config, ... }:
let
  cfg = config.setup.pipewire;
in
{
  options.setup.pipewire.enable = lib.mkEnableOption "Pipewire module";
  config = ( lib.mkIf cfg.enable {
    # pipewire handles audio and video processing
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  });
}
