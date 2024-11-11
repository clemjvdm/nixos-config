{ pkgs, config, lib, ... }:

let 
  cfg = config.setup.bluetooth;
in
{
  options.setup = {
    bluetooth = {
      enable = lib.mkEnableOption "Bluetooth support & tools";
    };
  };

  config = (lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
    environment.systemPackages = [ pkgs.bluez-tools ];
  });
}
