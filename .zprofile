#!bin/bash

#Automatic login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

