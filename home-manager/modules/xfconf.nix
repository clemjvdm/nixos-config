{config, lib, pkgs, ...}: 

# to copy a configuration made with GUI, use xfconf-query ex. `xfconf-query -c xfce4-panel -lv`

{
  xfconf.settings = {
    xfce4-keyboard-shortcuts = 
    {
      # window manipulation 
      "xfwm4/custom/<Super>m" = "maximize_window_key";
      "xfwm4/custom/<Super>h" = "hide_window_key";
      "xfwm4/custom/<Super>t" = "close_window_key";

      # window tiling
      "xfwm4/custom/<Super>Left" = "tile_left_key";
      "xfwm4/custom/<Super>Right" = "tile_right_key";
      "xfwm4/custom/<Super>Up" = "tile_up_key";
      "xfwm4/custom/<Super>Down" = "tile_down_key";
      "xfwm4/custom/<Primary><Super>Page_Up" = "move_window_prev_workspace_key";
      "xfwm4/custom/<Primary><Super>Page_Down" = "move_window_next_workspace_key";
      "xfwm4/custom/<Primary><Super>Right" = "right_workspace_key";
      "xfwm4/custom/<Primary><Super>Left" = "left_workspace_key";

      # application shortcuts
      "commands/custom/<Super>Return" = "exo-open --launch TerminalEmulator";

    };  

    xfce4-panel = {
      "panels" = [ 1 ];
      # Set number of panels to 1 (disables bottom panel)
      "panels/panel-1/length" = 100;
      "panels/panel-1/position" = "p=6;x=0;y=0";
      "panels/panel-1/position-locked" = true;
      "panels/panel-1/size" = 21;

      "panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 10 9 ];


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
      "plugins/plugin-8/digital-date-format" = "%d/%m/%Y";


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

      # system tray
      "plugins/plugin-10" = "systray";
      "plugins/plugin-10/known-legacy-items" = [];
      "plugins/plugin-10/symbolic-icons" = false;
    };
  };
}
