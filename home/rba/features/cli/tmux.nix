{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    historyLimit = 50000;
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    terminal = "xterm-256color";
    extraConfig = ''
      set -g status-keys vi

      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel
      bind -T copy-mode-vi C-v send -X rectangle-toggle

      bind p paste-buffer

      bind -r C-h previous-window
      bind -r C-l next-window

      set -ag terminal-overrides ",xterm-256color:RGB"

      setw -g pane-base-index 1

      bind r source-file ~/.tmux.conf \; display "Reloaded"

    '';
  };
}
