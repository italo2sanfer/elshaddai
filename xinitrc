
####################
# Instruções Gerais
####################
# Instalar dzen2

####################
# Outros Comentados
####################
## Papel de parede
#feh -bg-scale sessao-dia-dos-paispatricia-099.jpg
## Start Containers
#docker start ct-python-novo ct-apps
## Liberando UI Containers
#xhost +local:`docker inspect --format='{{ .Config.Hostname }}' ct-python-novo`
#xhost +local:`docker inspect --format='{{ .Config.Hostname }}' ct-apps`

####################
# Oficial
####################
# Seta layout de teclado
setxkbmap -model thinkpad60 -layout br

# Esquema de monitores
#xrandr --output eDP-1 --primary --auto --below HDMI-1
sh ~/.screenlayout/Hdmi_Esquerda.sh

# Desativa o beep
xset b off

##### dwm
while :;
do
    nivel=`acpi -i -b|grep harging|cut -f2 -d","|cut -c2-3`
#    end_eth=`ip addr show enp4s0|grep "inet "|cut -d" " -f6`
#    end_wla=`ip addr show wlp5s0|grep "inet "|cut -d" " -f6`
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

# Iniciando Applet para DWM Systray
nm-applet &
pnmixer &
#start-pulseaudio-x11 &
#mate-power-manager &

# Executando o slock (bloqueio de tela)
# O tempo aqui está em minutos
xautolock -time 5 -locker slock &


# Keyboard repeat delay and rate
xset r rate 250 60                          # keyboard repeat delay and rate

# Set root window background
xsetroot -solid darkgrey                    # set root window background

# Executando DWM
#exec dwm
exec ~/Workspace/elshaddai/dwm/dwm


# Outras sessões de Interface gráfica
#exec mate-session
#exec openbox-session
