
. ./.env

rm -rf $HOME/.rh-fontconfig

if [ x$GDMSESSION = "x" ]
then

if [ "`tty`" != "$CONSOLE" ]
then
	mesg y
	TITLE=$HOSTNAME
	exec $SHELL -l
fi
tset -Q
mesg y

CONSOLE=y
export CONSOLE
$ECHO -n "X Windows? "
trap "ans=none" 2
ans=`$HOME/bin/$MACHINE/input -d x -t x 5 -i none`
trap 2
case $ans in
x)	XAUTHORITY="/tmp/Xa$$"
	XLOG="/tmp/X.$$"
	rm -rf $XAUTHORITY $XLOG
	/usr/X11R6/bin/mkcookie $XAUTHORITY
case $MACHINE in
solaris)
		X11REV=R6
		XSERVER="/usr/openwin/bin/X -nobanner"
# For CDE
#		XINITRC=/usr/dt/bin/Xsession
		export X11REV;;
linux|freebsd|fedora)
		X11REV=R6
		XSERVER="/usr/X11R6/bin/X"
		export X11REV;;
esac
	xinit $XINITRC -- $XSERVER >$XLOG 2>&1
#	/usr/openwin/bin/openwin >$XLOG 2>&1
	rm -rf $XAUTHORITY $XLOG
	exit 0;;
none)	exec $SHELL -l;;
esac
exec $SHELL -l
fi
