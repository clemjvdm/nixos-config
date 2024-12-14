{
  gtk = {
    enable = true;
    gtk3 = {
      extraCss = ''
        window-frame, .window-frame:backdrop {
          box-shadow: 0 0 0 black;
          border-style: none;
          margin: 0px;
          border-radius: 0;
          box-shadow: none;
        }

        .popover, .popover.background {
          box-shadow: none;
        }

        decoration {
          box-shadow: none;
          margin: 0px;
        }

        .csd.popup {
          box-shadow: none;
        }

        tooltip {
          margin: 0px;
          border-radius: 0px;
          box-shadow: none;
        }
      '';
    };
  };
}
