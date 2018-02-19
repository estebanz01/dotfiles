function create_signed_cert {
  printf "\n#############################################\n"
  appname="$1"
  printf "\nCreating certs for app with name $appname\n### Step 1 ###\n"

  openssl genrsa -des3 -out "$appname.key" -passout pass:abc123 2048
  openssl req -new -key "$appname.key" -out "$appname.csr" -passin pass:abc123

  printf "\n### Step 2 ###\n"
  cp -v $appname.{key,original}
  openssl rsa -in "$appname".original -passin pass:abc123 -out "$appname".key
  rm -v "$appname".original

  printf "\n### Step 3 ###\n"
  openssl x509 -req -days 365 -in "$appname".csr -signkey "$appname".key -out "$appname".crt

  printf "\nDone! Copy the $appname.key and $appname.crt to the desired location.\n"
}

export -f create_signed_cert
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

alias submissions='cd ~/vhl/submissions'
alias chef='cd ~/vhl/chef-repo'

alias m3='cd ~/vhl/m3'
alias ua='cd ~/vhl/ua'
alias api='cd ~/vhl/api'
alias vhlstyle='cd ~/vhl/ruby-style-guide'
alias maestroclient='cd ~/vhl/maestro_client'
alias maestrocore='cd ~/vhl/maestro_core'
alias mae='cd ~/vhl/mae'
alias cms='cd ~/vhl/cms'
alias hicks='cd ~/vhl/hicks'
alias salesanalytics="cd ~/vhl/sales_analytics"
alias andromedavhl="cd ~/vhl/andromeda"
alias diller="cd ~/vhl/diller"
alias vhl-stats="cd ~/vhl/vhl-stats"

alias migrateall='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias rollbackall='rake db:rollback && rake db:rollback RAILS_ENV=test'

alias hydra="ssh ezapata@hydra.vistahl.com"
alias updatectags="ctags -R --exclude=public/*"

alias masterbranch="git co master && git pull && gem install bundler && bundle install && git gc && updatectags"
alias restartservices="sudo service nginx restart && sudo service mysql restart && redis-cli FLUSHALL && sudo systemctl restart cmb && sudo service cassandra restart"
alias startsidekiq="sudo pkill sidekiq; ua && sidekiq -d && m3 && sidekiq -d && api && sidekiq -d"

alias masterall="ua && masterbranch && api && masterbranch && m3 && masterbranch && mae && masterbranch && maestroclient && masterbranch && submissions && masterbranch && vhl-stats && masterbranch && andromedavhl && masterbranch && diller && masterbranch && restartservices && startsidekiq && ua"

alias updateall="sudo apt-get -y autoremove && sudo apt-get -y autoclean && sudo apt-get -y update && sudo apt-get -y upgrade -y && sudo apt-get -y autoclean && sudo apt-get -y autoremove"

