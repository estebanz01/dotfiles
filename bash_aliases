export HISTTIMEFORMAT='%Y-%b-%d %a %H:%M:%S - '
export PROMPT_COMMAND='history -a'

alias gpull='git pull; git submodule update;'
alias gm='git commit -m'

alias dspace='du -h --max-depth=1'
alias dfree='df -h'

alias bashrc='nano ~/.bash_aliases'
alias rbash='source ~/.bash_aliases'

alias sc='ruby script/console'
alias rc='rails console'

alias lh='ls -lAhrt --color'

alias api='cd ~/dev/api'
alias cms='cd ~/dev/cms && git remote update > /dev/null && git status -sbuno'
alias m3='cd ~/dev/m3 && git remote update > /dev/null && git status -sbuno'
alias mae='cd ~/dev/mae'
alias maestroclient='cd ~/dev/maestro_client'
alias ua='cd ~/dev/ua && rvm use ree && git remote update > /dev/null && git status -sbuno'

alias apiserver='api; rails server -p 3003'
alias cmsserver='cms; rails server -p 3002'
alias m3server='m3; rails server -p3001'
alias uaserver='ua; ruby script/server -p3000'


export M3_APP_PATH=~/dev/m3
