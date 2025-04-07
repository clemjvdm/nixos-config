
{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      gtk3
      pango
      cairo
      atk
      at-spi2-core
      dbus
      alsa-lib
      nss
      nspr
      cups
      xorg.libX11
      xorg.libXcomposite
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXrandr
      xorg.libxcb
      libdrm
      mesa
      ffmpeg
      expat
      libxkbcommon
    ];
  };
}
