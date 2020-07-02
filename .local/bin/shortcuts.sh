#!/bin/bash

# locations
locations="$HOME/.local/bin/locations"

# Output locations
shell_shortcuts="$HOME/.config/zsh/.shortcuts"
#ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"
lf_shortcuts="$HOME/.config/lf/shortcuts.conf"


# Shell rc file (i.e. bash vs. zsh, etc.)
shellrc="$HOME/.config/zsh/.zshrc"
#rangerrc="$HOME/.config/ranger/rc.conf"
lfrc="$HOME/.config/lf/lfrc"

# Remove
rm -f $shell_shortcuts $lf_shortcuts

# Ensuring that output locations are properly sourced
(grep "source ~/.config/zsh/.shortcuts"  $shellrc)>/dev/null || echo "source ~/.config/zsh/.shortcuts" >> $shellrc
#(grep "source $HOME/.config/ranger/shortcuts.conf" $rangerrc)>/dev/null || echo "source $HOME/.config/ranger/shortcuts.conf" >> $HOME/.config/ranger/rc.conf
(grep "source ~/.config/lf/shortcuts.conf" $lfrc)>/dev/null || echo "source ~/.config/lf/shortcuts.conf" >> $lfrc


#shell_shortcuts
sed "/^#/d" $locations| sed -r '/^\s*$/d' | awk '$2!="-" {print "alias g"$1"=\"cd "$2"\""} $3!=""&&$3!="-"{print "alias f"$1"=\"nvim "$3"\""}' > $shell_shortcuts

#ranger_shortcuts
#sed "/^#/d" $locations|sed -r '/^\s*$/d' | awk '$2!="-" {print "map g"$1" cd "$2"\nmap m"$1" shell mv -v %s "$2"\nmap Y"$1" shell cp -rv %s "$2} $3!=""&&$3!= "-"{print "map f"$1" shell nvim "$3""}' > $ranger_shortcuts 

#lf shortcuts
sed "/^#/d" $locations|sed -r '/^\s*$/d' | awk '$2!="-" {print "map g"$1" cd "$2""} $3!=""&&$3!= "-"{print "map f"$1" $$EDITOR "$3""}' > $lf_shortcuts
