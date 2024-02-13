GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

export PS1="${GREEN}\A \u@\H:$PWD${RESET}> "

function update-bash-profile() {
    echo "Updating bash profile..." && \
        curl -s -o ~/.bash_profile https://raw.githubusercontent.com/madsboddum/prompt/master/.bash_profile && \
        source ~/.bash_profile && \
        echo "Done!"
}

echo "Run 'update-bash-profile' to update bash profile to the latest version."

