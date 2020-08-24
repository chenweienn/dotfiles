# ANSI color codes
# https://help.ubuntu.com/community/CustomizingBashPrompt
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
# export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\t \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ "
# export PS1="\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\t \u@\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]$ "
export PS1="\[\e]0;\u@\h: \w\a\]$FGRN\t \u$FYEL@$FCYN\W$RS$ "

export PATH=/Users/wchen/packages/google-cloud-sdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Wireshark.app/Contents/MacOS:/Users/wchen/Library/Python/2.7/bin

# setup GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:/Users/wchen/go/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wchen/packages/google-cloud-sdk/path.bash.inc' ]; then source '/Users/wchen/packages/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wchen/packages/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/wchen/packages/google-cloud-sdk/completion.bash.inc'; fi

# jenv, conflicting with CoC
export PATH="$HOME/.jenv/shims:$HOME/.jenv/bin:$PATH"
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

# ??
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# openssl 1.1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"



export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# kubectl shortcuts
alias k=kubectl
complete -F __start_kubectl k
alias ns=kubens
alias ctx=kubectx

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
