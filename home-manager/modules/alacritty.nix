{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
        # normal.family = "FiraCode Nerd Font Mono";
        normal.family = "DejaVu Sans Mono";
      };

      env = {
        TERM = "xterm-256color";
      };

      window = {
        decorations = "none";
        padding.x = 5;
        padding.y = 10;
        opacity = 0.8;
        blur = true;
      };
    };
  };
}
