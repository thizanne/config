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

xrandr --output eDP-1 --auto --output DP-1-0 --auto --right-of eDP-1 || 1
feh --bg-fill --randomize ~/.wallpaper/* &
nm-applet &
blueberry-tray &
xmodmap ~/.xmodmap &

exec xmonad
