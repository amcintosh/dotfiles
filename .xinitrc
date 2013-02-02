#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


xrdb -merge ~/.Xresources

# Ensure numlock is on
numlockx &

thunar --daemon &
dropboxd &

# Re-enable Ctrl-Alt-Bksp to kill X
setxkbmap -option terminate:ctrl_alt_bksp &

# Run the tint2 panel
(sleep 2 && tint2) &

# Set up XScreensaver
xscreensaver -no-splash &

# Set cursor to pointer (otherwise, it is an X)
xsetroot -curcor_name left_ptr

# Start the urxvt Daemon for speed
urxvtd -q -f -o &


# exec gnome-session
# exec startkde
# exec startxfce4
exec openbox-session
# ...or the Window Manager of your choice
