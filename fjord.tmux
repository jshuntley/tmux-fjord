# tmux-fjord — Fjord theme
# Author: jshuntley
# Version: 1.0.0

# Truecolor support
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*:Tc"

# Palette
set -g @fjord-bg          "#1B2532"
set -g @fjord-fg          "#E4EDE5"
set -g @fjord-muted       "#6C7A86"
set -g @fjord-line        "#233141"
set -g @fjord-green       "#9DD99A"
set -g @fjord-blue        "#5DA6EA"
set -g @fjord-cyan        "#B8E7E9"
set -g @fjord-amber       "#FFD285"
set -g @fjord-red         "#F37C7C"
set -g @fjord-purple      "#B9A0F8"

# Status Bar
set -g status on
set -g status-bg "#1B2532"
set -g status-fg "#6C7A86"
set -g status-justify centre
set -g status-position bottom
set -g status-interval 2

# Left: session name in green
set -g status-left-length 40
set -g status-left "#[fg=#1B2532,bg=#9DD99A] #[fg=#1B2532,bg=#9DD99A] #S #[fg=#9DD99A,bg=#1B2532] "

# Right: time and date in blue + cyan
set -g status-right-length 80
set -g status-right " #[fg=#1B2532,bg=#5DA6EA]#[fg=#1B2532,bg=#5DA6EA] %R #[fg=#5DA6EA,bg=#1B2532] #[fg=#1B2532,bg=#B8E7E9]#[fg=#1B2532,bg=#B8E7E9] %Y-%m-%d #[fg=#B8E7E9,bg=#1B2532] "

# Windows
set -g window-status-format " #I:#W#F "
set -g window-status-style "fg=#6C7A86,bg=#1B2532"

set -g window-status-current-format "#[fg=#1B2532,bg=#5DA6EA] #[fg=#1B2532,bg=#5DA6EA] #I:#W #[fg=#5DA6EA,bg=#1B2532]"
set -g window-status-current-style "fg=#1B2532,bg=#5DA6EA,bold"

set -g window-status-activity-style "fg=#FFD285,bg=#1B2532"
set -g window-status-bell-style "fg=#F37C7C,bg=#1B2532,bold"

# Panes
set -g pane-border-style "fg=#233141"
set -g pane-active-border-style "fg=#9DD99A"

# Display pane numbers overlay
set -g display-panes-active-style "bg=#FFD285,fg=#1B2532"
set -g display-panes-style "bg=#5DA6EA,fg=#1B2532"
set -g display-panes-time 1000

# Messages and prompts
set -g message-style "bg=#FFD285,fg=#1B2532"
set -g message-command-style "bg=#5DA6EA,fg=#1B2532"

# Modes (copy/choose-tree)
set -g mode-style "bg=#233141,fg=#E4EDE5"
setw -g mode-keys vi
setw -g copy-mode-match-style "bg=#5DA6EA,fg=#1B2532"
setw -g copy-mode-current-match-style "bg=#FFD285,fg=#1B2532"

# Clock
setw -g clock-mode-colour "#7BB8FF"
setw -g clock-mode-style 24

# Mouse (optional)
set -g mouse on

