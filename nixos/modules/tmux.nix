{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
    # change prefix key
    unbind C-b
    set -g prefix C-space
    bind C-space send-prefix

    # transparent status bar
    set-option -g status-style bg=default

    # start windows and panes at index 1
    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on

    # open panes in current working directory
    bind '"' split-window -v -c "#{pane_current_path}"
    bind % split-window -h -c "{pane_current_path}"

    # enable mouse
    set -g mouse on 
    set -g mouse-select-pane on
    '';
  };
}
