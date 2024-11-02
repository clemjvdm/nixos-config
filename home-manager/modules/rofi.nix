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

      show-icons = true;
    };
  };
}
