{ pkgs, ...}: {
  # fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
