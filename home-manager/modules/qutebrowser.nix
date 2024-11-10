{
  programs.qutebrowser = {
    enable = true;
    extraConfig = builtins.readFile ../other_files/qutebrowser-config.py;
  };
}
