COLOR_DEFAULT="\[\e[m\]"
COLOR_PRIMARY="\[\e[97m\]"	# White
COLOR_SECONDARY="\[\e[93m\]"	# Light yellow
COLOR_TERTIARY="\[\e[36m\]"	# Cyan

PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n'	# set window title

PS1="$PS1$COLOR_PRIMARY╭─$COLOR_DEFAULT"	# curved line
PS1="$PS1$COLOR_PRIMARY[$COLOR_TERTIARY\u@\H$COLOR_PRIMARY]$COLOR_DEFAULT"				# user@FQDN (Fully Qualified Domain Name)
PS1="$PS1$COLOR_PRIMARY—$COLOR_DEFAULT"					# separator
PS1="$PS1$COLOR_PRIMARY[$COLOR_TERTIARY\w$COLOR_PRIMARY]"			        	# current working directory
PS1="$PS1\n$COLOR_PRIMARY╰─🞂$COLOR_SECONDARY \$$COLOR_DEFAULT "	# $ or # if root

MSYS2_PS1="$PS1"				# set the constructed prompt as the active one
