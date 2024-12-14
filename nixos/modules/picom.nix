{ lib, config, ... }:
let
  cfg = config.setup.picom;
in
{
  options.setup.picom.enable = lib.mkEnableOption "Picom module";
  config = ( lib.mkIf cfg.enable {
    services.picom = {
      enable = true;
      backend = "glx";
      shadow = true;
      shadowOpacity = 0.9;
      settings = {
        blur = {
          method = "gaussian";
          size = 10;
          deviation = 5.0;
        };
      };
    };
  });
}
