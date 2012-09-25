export GTK2_RC_FILES=$HOME/.gtkrc-2.0
DEFAULT_SESSION=xmonad
emacs --daemon &
urxvtd -q -o -f &
xbindkeys &
setxkbmap -layout fr -option ctrl:swapcaps &
numlockx &
feh --bg-center ~/.xmonad/wallpaper.jpg &
xset s off &
xset r rate 400 80 &

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true \
    --tint 0xffffff --width 3 --transparent true --alpha 0 --height 17 &
xmodmap ~/.xmodmap &

case $1 in
    awesome) exec awesome ;;
    xmonad) exec xmonad ;;
    *) exec $DEFAULT_SESSION ;;
esac
