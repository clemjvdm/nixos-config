{ pkgs, config, lib, ... }:
let 
  cfg = config.setup.cinnamon;
in
{
  options.setup.cinnamon.enable = lib.mkEnableOption "Cinnamon desktop environment";
  imports = [ ./xorg.nix ];
  config = (lib.mkIf cfg.enable {
    setup.xorg.enable = true;
    services.libinput.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.cinnamon.enable = true;
    services.displayManager.defaultSession = "cinnamon";
  });
}
