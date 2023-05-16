#!/bin/sh

xmenu <<EOF | sh &
Shutdown		systemctl poweroff
Reboot		systemctl reboot

Suspend		systemctl suspend
Hibernate		systemctl hibernate

Lock		slock
Logout		loginctl terminate-session ${XDG_SESSION_ID}
EOF
