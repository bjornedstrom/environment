#!/bin/bash

xmonad --recompile
gconftool-2 -s /desktop/gnome/session/required_components/windowmanager xmonad --type string
