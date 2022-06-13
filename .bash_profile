export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin

# change prompt to "hh:mm:ss user@hostname:dir$ "
# PS1="[\t] \u:\W\$ "
# PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\t \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# allow tmux to load ~/.bashrc
# https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wchen/packages/google-cloud-sdk/path.bash.inc' ]; then source '/Users/wchen/packages/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wchen/packages/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/wchen/packages/google-cloud-sdk/completion.bash.inc'; fi
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# bash completion for Cloud Foundry CLI
# https://raw.githubusercontent.com/cloudfoundry/cli/master/ci/installers/completion/cf
_cf-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _cf-cli cf

# add mysql path
export PATH=$PATH:/usr/local/mysql/bin

# add python
export PATH=$PATH:/Users/wchen/Library/Python/2.7/bin

# add sslkeylog.log
export SSLKEYLOGFILE=/Users/wchen/tmp/sslkeylog.log

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
