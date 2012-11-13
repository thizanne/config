export GTK2_RC_FILES=$HOME/.gtkrc-2.0
DEFAULT_SESSION=xmonad
urxvtd -q -o -f &
xbindkeys &
setxkbmap -layout fr -option ctrl:swapcaps &
numlockx &
# xset s off &
xset r rate 400 80 &
xsetroot -cursor_name left_ptr &

trayer --edge top --align right --SetDockType true --alpha 0 \
            --SetPartialStrut true --expand true --tint 0xffffff \
            --transparent true --height 17 --widthtype request --margin 160 &

feh --bg-center ~/.xmonad/wallpaper.jpg &
xmodmap ~/.xmodmap &

exec xmonad
