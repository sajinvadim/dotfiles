#!/bin/sh

xkb-switch | awk '{print substr($0,0,2)}'

exit 0
