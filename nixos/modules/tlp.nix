{ config, lib, ... }:

let
  cfg = config.setup.tlp;
in 
{
  options.setup.tlp.enable = lib.mkEnableOption "tlp module";
  config = ( lib.mkIf cfg.enable {
    services.tlp.enable = true;
  });
}
