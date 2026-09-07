{
  config,
  pkgs,
  ...
}:
let
  script = name: "${config.dotfiles.scriptPackages.${name}}/bin/${name}";
in
{
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    escapeTime = 0;
    keyMode = "vi";
    historyLimit = 50000;
    baseIndex = 1;
    mouse = true;
    terminal = "screen-256color";
    aggressiveResize = true;
    focusEvents = true;

    plugins = [
      pkgs.tmuxPlugins.yank
      pkgs.tmuxPlugins.sensible
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = pkgs.tmuxPlugins.continuum;
        extraConfig = "set -g @continuum-restore 'on'";
      }
    ];

    extraConfig = ''
      # --------------------------------------------------------------------------
      # general
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g default-terminal 'screen-256color'
      set -g terminal-overrides ',xterm-256color:RGB'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -as terminal-features ',*:RGB'

      setw -g monitor-activity on
      set -g bell-action any
      set -g visual-bell off
      set -g visual-activity off
      set -g detach-on-destroy off

      # unbind the default prefix so only C-a works
      unbind C-b

      # --------------------------------------------------------------------------
      # key bindings
      bind C-a send-prefix
      bind r source-file ~/.config/tmux/tmux.conf\; display-message 'tmux.conf reloaded'
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind f resize-pane -Z
      bind o switch-client -l
      bind y run -b "tmux show-buffer | xclip -selection clipboard"\; display-message "copied tmux buffer to clipboard"
      bind q kill-pane
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind -r '<' swap-window -d -t -1
      bind -r '>' swap-window -d -t +1

      # --------------------------------------------------------------------------
      # Theme: Tokyonight Night
      set -g status-style "bg=#1a1b26,fg=#c0caf5"
      set -g status-left " "
      set -g status-left-length 100
      set -g window-status-format "#[fg=#565f89]#W"
      set -g window-status-current-format "#[fg=#{?window_zoomed_flag,#e0af68,#7aa2f7},bold]#W"
      set -g status-right-length 100
      set -g status-right "#[fg=#7aa2f7,bold]#S "
      set -g pane-border-style "fg=#565f89"
      set -g pane-active-border-style "fg=#7aa2f7"
      set -g message-style "bg=#1a1b26,fg=#7aa2f7"
      set -g message-command-style "bg=#1a1b26,fg=#7dcfff"
      set -g mode-style "bg=#7aa2f7,fg=#1a1b26,bold"

      # --------------------------------------------------------------------------
      # Scripts
      bind-key w display-popup -E "${script "__select_wordlist"}"
      bind-key / display-popup -E "${script "__snippets"}"
      bind-key a new-window -n agenda "${script "__agenda"}"
      bind-key m new-window -n sessions "${script "__sessionizer"}"
      bind-key d new-window -n notes "${script "__select_note"}"
      bind-key g new-window -n lazygit -c "#{pane_current_path}" "lazygit"
    '';
  };
}
