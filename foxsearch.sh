#!/bin/bash
choice=$(rofi -dmenu -p "Google")
firefox --new-tab --search "$choice"
