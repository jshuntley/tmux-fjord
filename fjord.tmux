#!/usr/bin/env bash
# Copyright (c) 2025 jshuntley

FJORD_TMUX_COLOR_THEME_FILE=src/fjord.conf
FJORD_TMUX_VERSION=0.1.0
FJORD_TMUX_STATUS_CONTENT_FILE="src/fjord-status-content.conf"
FJORD_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE="src/fjord-status-content-no-patched-font.conf"
FJORD_TMUX_STATUS_CONTENT_OPTION="@fjord_tmux_show_status_content"
FJORD_TMUX_STATUS_CONTENT_DATE_FORMAT="@fjord_tmux_date_format"
FJORD_TMUX_NO_PATCHED_FONT_OPTION="@fjord_tmux_no_patched_font"
_current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

__cleanup() {
  unset -v FJORD_TMUX_COLOR_THEME_FILE FJORD_TMUX_VERSION
  unset -v FJORD_TMUX_STATUS_CONTENT_FILE FJORD_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE
  unset -v FJORD_TMUX_STATUS_CONTENT_OPTION FJORD_TMUX_NO_PATCHED_FONT_OPTION
  unset -v FJORD_TMUX_STATUS_CONTENT_DATE_FORMAT
  unset -v _current_dir
  unset -f __load __cleanup
  tmux set-environment -gu FJORD_TMUX_STATUS_TIME_FORMAT
  tmux set-environment -gu FJORD_TMUX_STATUS_DATE_FORMAT
}

__load() {
  tmux source-file "$_current_dir/$FJORD_TMUX_COLOR_THEME_FILE"

  local status_content=$(tmux show-option -gqv "$FJORD_TMUX_STATUS_CONTENT_OPTION")
  local no_patched_font=$(tmux show-option -gqv "$FJORD_TMUX_NO_PATCHED_FONT_OPTION")
  local date_format=$(tmux show-option -gqv "$FJORD_TMUX_STATUS_CONTENT_DATE_FORMAT")

  if [ "$(tmux show-option -gqv "clock-mode-style")" == '12' ]; then
    tmux set-environment -g FJORD_TMUX_STATUS_TIME_FORMAT "%I:%M %p"
  else
    tmux set-environment -g FJORD_TMUX_STATUS_TIME_FORMAT "%H:%M"
  fi

  if [ -z "$date_format" ]; then
    tmux set-environment -g FJORD_TMUX_STATUS_DATE_FORMAT "%Y-%m-%d"
  else
    tmux set-environment -g FJORD_TMUX_STATUS_DATE_FORMAT "$date_format"
  fi

  if [ "$status_content" != "0" ]; then
    if [ "$no_patched_font" != "1" ]; then
      tmux source-file "$_current_dir/$FJORD_TMUX_STATUS_CONTENT_FILE"
    else
      tmux source-file "$_current_dir/$FJORD_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE"
    fi
  fi
}

__load
__cleanup

