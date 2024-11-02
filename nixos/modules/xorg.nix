{
  services.xserver = {  # enable X11 and XFCE
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";

  services.xserver.xkb.layout = "us";  # configure X11 keymap
  services.xserver.xkb.options = "eurosign:e,caps:escape";
}
