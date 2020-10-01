xrdb -load .Xresources
xrdb -nocpp -merge .Xkeycodes
urxvtd -q -o -f &
xbindkeys &
setxkbmap -layout fr -option ctrl:swapcaps
numlockx &
xset s off &
xsetroot -cursor_name left_ptr &

# killall trayer
trayer --edge top --align right --SetDockType true --alpha 0 \
            --SetPartialStrut true --expand true --tint 0x002b36 \
            --transparent true --height 40 --widthtype request --margin 700 &

feh --bg-fill ~/.xmonad/wallpaper.jpg &
nm-applet &
xmodmap ~/.xmodmap &

exec xmonad
