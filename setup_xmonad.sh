#!/bin/bash

xmonad --recompile

echo "Do either

gconftool-2 -s /desktop/gnome/session/required_components/windowmanager xmonad --type string

or create .gnomerc

export WINDOW_MANAGER=xmonad"
