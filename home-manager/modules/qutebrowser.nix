{
  programs.qutebrowser = {
    enable = true;
    extraConfig = builtins.readFile ../resources/qutebrowser-config.py;
  };
}
