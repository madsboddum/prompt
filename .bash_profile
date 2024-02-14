# Load ~/.bashrc if it exists: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

export PS1="${GREEN}\A \u@\H:\$(pwd)${RESET}> "

function _download() {
  if command -v curl &> /dev/null; then
    # Check if curl is installed and use it to download the file if it is
    echo "Downloading $1 to $2 using curl..."
    curl -s -o $2 $1
    return $?
  elif command -v wget &> /dev/null; then
    # If curl is not installed, check if wget is installed and use it to download the file if it is
    echo "Downloading $1 to $2 using wget..."
    wget -q -O $2 $1
    return $?
  else
    # If neither curl nor wget is installed, print an error message
    echo "Neither curl nor wget is installed. Cannot download $1 to $2."
    return 1
  fi
}

function update_bash_profile() {
  echo "Updating bash profile..." && \
    _download https://raw.githubusercontent.com/madsboddum/prompt/master/.bash_profile ~/.bash_profile && \
    source ~/.bash_profile && \
    echo "Done!"
}

alias ll="ls -lah"
