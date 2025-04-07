{ pkgs, ...}: {
  # fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    dejavu_fonts
    liberation_ttf
    fira-code
    fira-code-symbols
    nerd-fonts.bigblue-terminal
    nerd-fonts.fira-code
    ibm-plex
  ];
}
