# Fjord tmux

A clean and elegant tmux color theme inspired by Nordic fjords.

## About

Fjord-tmux is a tmux plugin based on [Nord tmux](https://github.com/nordtheme/tmux) by Sven Greb. It maintains the clean, structured design of Nord while using a custom color palette inspired by Norwegian fjords.

## Installation

### Using TPM

Add this line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'jshuntley/tmux-fjord'
```

Then press `prefix` + <kbd>I</kbd> to fetch and install the plugin.

### Manual Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/jshuntley/tmux-fjord ~/.tmux/plugins/tmux-fjord
   ```

2. Add this line to your `~/.tmux.conf`:
   ```tmux
   run '~/.tmux/plugins/tmux-fjord/fjord.tmux'
   ```

3. Reload tmux configuration:
   ```bash
   tmux source-file ~/.tmux.conf
   ```

## Configuration

### Status Content

To disable the status bar content:

```tmux
set -g @fjord_tmux_show_status_content 0
```

### Date Format

Customize the date format in the status bar:

```tmux
set -g @fjord_tmux_date_format "%Y-%m-%d"
```

### No Patched Font

If you don't have a powerline-patched font installed, disable the special characters:

```tmux
set -g @fjord_tmux_no_patched_font 1
```

## Plugin Support

Fjord supports the following plugins:

- [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight) - Shows a visual indicator when prefix is pressed

To use tmux-prefix-highlight, install it AFTER the Fjord theme:

```tmux
set -g @plugin 'jshuntley/tmux-fjord'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
```

## Credits

This plugin is based on [Nord tmux](https://github.com/nordtheme/tmux) by [Sven Greb](https://www.svengreb.de). The code structure and implementation follow Nord's excellent design.

## License

Copyright (c) 2016-present Sven Greb <development@svengreb.de>  
Copyright (c) 2025 jshuntley

Licensed under the [MIT License](LICENSE).
