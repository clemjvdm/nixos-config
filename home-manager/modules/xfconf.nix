{config, lib, ...}: 

# to copy a configuration made with GUI, use xfconf-query ex. `xfconf-query -c xfce4-panel -lv`

let hasRofi = lib.hasAttr "rofi" config.home.packages;
  hasAlacritty = lib.hasAttr "alacritty" config.home.packages;
in 
{
  xfconf.settings = {
    xfce4-keyboard-shortcuts = 
    {
      # WM shortucts
      "xfwm4/custom/<Super>m" = "maximize_window_key";
      "xfwm4/custom/<Super>h" = "hide_window_key";
      "xfwm4/custom/<Super>t" = "close_window_key";
      # Rofi shortcuts
      # TODO: make conditional if rofi
      "commands/custom/<Super>d" = "rofi -show drun";
      "commands/custom/<Super>r" = "rofi -show run";
      "commands/custom/<Super>w" = "rofi -show window";
    };
    xfce4-panel = {
      # Set number of panels to 1 (disables bottom panel)
      "panels/panel-1/length" = 100;
      "panels/panel-1/position" = "p=6;x=0;y=0";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/size" = 21;

      "panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 ];


      # applicationsmenu
      "plugins/plugin-1" = "applicationsmenu";
      "plugins/plugin-1/small" = false;

      # windows buttons 
      "plugins/plugin-2" = "tasklist";

      # separator
      "plugins/plugin-3" = "separator";
      "plugins/plugin-3/expand" = true;
      "plugins/plugin-3/style" = 0;

      # workspaces menu
      "plugins/plugin-4" = "pager";

      # power manager (battery icon)
      "plugins/plugin-5" = "power-manager-plugin";

      # notifications 
      "plugins/plugin-6" = "notification-plugin";

      # pulseaudio
      "plugins/plugin-7" = "pulseaudio";
      "plugins/plugin-7/enable-keyboard-shortcuts" = true;

      # clock
      "plugins/plugin-8" = "clock";
      "plugins/plugin-8/mode" = 2;

      # action menu
      "plugins/plugin-9" = "actions";
      "plugins/plugin-9/appearance" = 1; 
      "plugins/plugin-9/items" = [
        "+lock-screen"
        "-switch-user"
        "+separator"
        "+suspend"
        "+hibernate"
        "+hybrid-sleep"
        "-separator"
        "+shutdown"
        "+restart"
        "+separator"
        "+logout"
        "-logout-dialog"
      ]; 
    };
  };
}
