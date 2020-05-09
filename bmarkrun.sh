#!/bin/bash
choice=$(cat ~/dotfiles/bookmarks | rofi -i -dmenu -p "Bookmarks")


firefox --new-tab $choice
