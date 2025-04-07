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

    #options.setup.picom.enable = lib.mkEnableOption "Picom module";
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
