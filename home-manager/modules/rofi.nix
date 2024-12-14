{
  programs.rofi = {
    enable = true;
    extraConfig = {

      # navigate menu
      kb-row-left = "Control+h";
      kb-row-right = "Control+l";
      kb-row-up = "Up,Control+k";
      kb-row-down = "Down,Control+j";

      # unbind Control + h/k/l/j from the default bindings
      kb-remove-char-back =  "BackSpace";
      kb-accept-entry = "Control+m,Return,KP_Enter";
      kb-remove-to-eol = "";
      kb-mode-complete = "";

      # enable filebrowser
      modes = ["window" "drun" "run" "ssh" "filebrowser"];

      show-icons = true;
    };
    # theme = "Indego";
    theme = ../resources/rofi-theme.rasi;
  };

  # xfce shortcuts (if xfce is enabled)
  xfconf.settings.xfce4-keyboard-shortcuts = {
    "commands/custom/<Super>d" = "rofi -show drun";
    "commands/custom/<Super>r" = "rofi -show run";
    "commands/custom/<Super>w" = "rofi -show window";
    "commands/custom/<Super>f" = "rofi -show filebrowser";
  };
}
