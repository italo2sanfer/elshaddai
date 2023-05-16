#!/bin/sh

xmenu <<EOF | sh &
All
	IMG:./icons/web.png	Chrome	google-chrome
	IMG:./icons/web.png	Xterm	xterm
	IMG:./icons/web.png	Vim	gvim
	IMG:./icons/gimp.png	Gimp	gimp
	IMG:./icons/gimp.png	MC	xterm -e mc
	IMG:./icons/gimp.png	arandr	arandr

Chrome	google-chrome
Xterm	xterm
Vim	gvim
EOF
