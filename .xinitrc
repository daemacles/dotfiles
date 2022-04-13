unity-settings-daemon &
disown
sleep 1
setxkbmap -option "ctrl:swapcaps"
xmodmap ~/.Xmodmap
#xsettingsd &
#exec xterm
exec i3
