if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[39m\]'       # change to white text
	PS1="$PS1"'\e[45m\e[39m'       # powerline bar begin
        PS1="$PS1"' \t '             # 24 hour time
        PS1="$PS1"'\e[35m\e[49m\e[44m'       # powerline bar end
	PS1="$PS1"'\[\033[0m\]\e[44m'        # change to white
	PS1="$PS1"'\e[44m\e[39m'       # powerline bar begin
	PS1="$PS1"' \w '                 # current working directory
	PS1="$PS1"'\e[34m'      # powerline bar (almost) end
	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'`__git_ps1 "\e[42m\e[42m\e[39m  %s \e[32m\e[49m\e[49m"`'
		fi
	fi

	if [ `__git_ps1` -z ]
	then
	# Git repository did not exist. End powerline bar the default way
		PS1="$PS1"'\e[49m'
	fi

	PS1="$PS1"'\[\033[39m\]'       # change to white text
	PS1="$PS1"'\n\n'        # 2x newline
	PS1="$PS1"': '
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
