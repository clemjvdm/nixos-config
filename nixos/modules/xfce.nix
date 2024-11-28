{ pkgs, lib, config, ... }:
let
  cfg = config.setup.xfce;
in 
{
  options.setup.xfce.enable = lib.mkEnableOption "XFCE Desktop Environment";
  imports = [ ./xorg.nix ];
  config = (lib.mkIf cfg.enable {
    setup.xorg.enable = true;
    services.xserver.desktopManager.xfce.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.displayManager.defaultSession = "xfce";
  });
}
