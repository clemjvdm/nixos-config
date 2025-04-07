{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
        # normal.family = "FiraCode Nerd Font Mono";
        # normal.family = "DejaVu Sans Mono";
        # normal.family = "BigBlueTerm437 Nerd Font Mono";
        normal.family = "IBM Plex Mono Text";
      };

      env = {
        TERM = "xterm-256color";
      };

    };
  };
}
