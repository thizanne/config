export GTK2_RC_FILES=$HOME/.gtkrc-2.0
DEFAULT_SESSION=xmonad

xrdb -load .Xresources
urxvtd -q -o -f &
xbindkeys &
setxkbmap -layout fr #-option ctrl:swapcaps
loadkeys fr
# numlockx &
# xset s off &
xsetroot -cursor_name left_ptr &

# trayer --edge top --align right --SetDockType true --alpha 0 \
#             --SetPartialStrut true --expand true --tint 0x002b36 \
#             --transparent true --height 40 --widthtype request --margin 400 &

feh --bg-center ~/.xmonad/wallpaper.jpg &
xset b off & # Do not beep/bell
# xmodmap ~/.xmodmap &

# exec xmonad
