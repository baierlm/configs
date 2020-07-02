

if [[ "$1" == 'writer' ]]; then
    xmodmap -e 'keycode 66 = Escape'
    xmodmap -e 'clear lock'
    xmodmap -e 'keycode 9 = Caps_Lock'
    xmodmap -e 'keycode 47 = odiaeresis Odiaeresis odiaeresis Odiaeresis odiaeresis Odiaeresis dead_doubleacute dead_belowdot odiaeresis Odiaeresis dead_doubleacute dead_belowdot'
    xmodmap -e 'keycode 48 = adiaeresis Adiaeresis adiaeresis Adiaeresis adiaeresis Adiaeresis dead_caron adiaeresis Adiaeresis dead_circumflex dead_caron adiaeresis Adiaeresis dead_circumflex dead_caron'
    xmodmap -e 'keycode  16 = 7 slash 7 slash braceleft seveneighths braceleft seveneighths 7 slash braceleft seveneighths 7 slash braceleft seveneighths'
    xmodmap -e 'keycode  17 = 8 parenleft 8 parenleft bracketleft trademark bracketleft trademark 8 parenleft bracketleft trademark 8 parenleft bracketleft trademark'
    xmodmap -e 'keycode  18 = 9 parenright 9 parenright bracketright plusminus bracketright plusminus 9 parenright bracketright plusminus 9 parenright bracketright plusminus'
    xmodmap -e 'keycode  19 = 0 equal 0 equal braceright degree braceright degree 0 equal braceright degree 0 equal braceright degree'

    xset r rate 300 50
else    
    xmodmap -e 'keycode 66 = Escape'
    xmodmap -e 'clear lock'
    xmodmap -e 'keycode 9 = Caps_Lock'
    xmodmap -e 'keycode 47 = bracketleft braceleft odiaeresis Odiaeresis odiaeresis Odiaeresis dead_doubleacute dead_belowdot odiaeresis Odiaeresis dead_doubleacute dead_belowdot'
    xmodmap -e 'keycode 48 = bracketright braceright adiaeresis Adiaeresis adiaeresis Adiaeresis dead_caron adiaeresis Adiaeresis dead_circumflex dead_caron adiaeresis Adiaeresis dead_circumflex dead_caron'
    xmodmap -e ' keycode  16 = 7 slash 7 slash 7 seveneighths 7 seveneighths 7 slash braceleft seveneighths 7 slash braceleft seveneighths'
    xmodmap -e ' keycode  17 = 8 parenleft 8 parenleft 8 trademark 8 trademark 8 parenleft bracketleft trademark 8 parenleft bracketleft trademark'
    xmodmap -e 'keycode  18 = 9 parenright 9 parenright 9 plusminus 9 plusminus 9 parenright bracketright plusminus 9 parenright bracketright plusminus'
    xmodmap -e 'keycode  19 = 0 equal 0 equal 0 degree 0 degree 0 equal braceright degree 0 equal braceright degree'

    xset r rate 300 50

fi
