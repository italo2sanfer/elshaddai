setxkbmap -model thinkpad60 -layout br
sh ~/.screenlayout/Hdmi_Esquerda.sh
# Desativa o beep
xset b off

##### dwm
while :;
do
    nivel=`acpi -i -b|grep harging|cut -f2 -d","|cut -c2-3`
    agora=`date +"%a, %d/%m/%Y, %H:%M:%S"`
    volume_master=`amixer sget Master|grep "%]"|cut -d"[" -f2|cut -d"]" -f1`
    situacao_speaker=`amixer sget Speaker|grep dB|grep Left|cut -d"]" -f3|cut -d"[" -f2`
    situacao_headphone=`amixer sget Headphone|grep dB|grep Left|cut -d"]" -f3|cut -d"[" -f2`
    if [ `acpi -i -b |grep ": Discharging"|wc -l` -eq 1 ]
    then
        bateria=$nivel"%(-)"
        if [ $(($nivel)) -le 15 ]
        then
            echo "Menos de 15%"|dzen2 -p 2 -fg green -bg red
        fi
    elif [ `acpi -i -b |grep ": Charging"|wc -l` -eq 1 ]
    then
        bateria=$nivel"%(+)"
    else
        bateria="FULL"
    fi
    xsetroot -name "VM=$volume_master, Spk=$situacao_speaker, Hph=$situacao_headphone, $agora, $bateria"
    sleep 1
done &
nm-applet &
pnmixer &
xautolock -time 5 -locker slock &
xset r rate 250 60                          # keyboard repeat delay and rate
xsetroot -solid darkgrey                    # set root window background
exec ~/Workspace/elshaddai/dwm/dwm

##### mate
#exec mate-session
