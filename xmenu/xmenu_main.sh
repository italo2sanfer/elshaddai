#!/bin/sh

xmenu <<EOF | sh &
Chrome	google-chrome
Xterm	xterm
Vim	gvim

All
	IMG:./icons/web.png	Chrome	google-chrome
	IMG:./icons/web.png	Xterm	xterm
	IMG:./icons/web.png	Vim	gvim
	IMG:./icons/gimp.png	Gimp	gimp
	IMG:./icons/gimp.png	MC	xterm -e mc
	IMG:./icons/gimp.png	arandr	arandr

Power
	IMG:./icons/web.png	Shutdown	systemctl poweroff
	IMG:./icons/web.png	Reboot	systemctl reboot
	IMG:./icons/web.png	Suspend	systemctl suspend
	IMG:./icons/web.png	Hibernate	systemctl hibernate
	IMG:./icons/web.png	Lock	slock
	IMG:./icons/web.png	Logout	loginctl terminate-session ${XDG_SESSION_ID}
EOF
