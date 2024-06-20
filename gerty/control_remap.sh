#!/bin/bash

xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "remove control = Control_L"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add control = Control_L"
