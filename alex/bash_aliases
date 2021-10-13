alias vi='nvim'
alias vim='nvim'
alias nvi='nvim'
alias ls='ls -G'
alias lt='ls -lhtr'
function ltt { ls -lhtr $1 | tail -$2; }
alias sdiff='sdiff -w $(tput cols)'
alias ggl="git log --all --graph --decorate --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gg='ggl | head -30'
alias gs='git status'
alias vigs='vi $(git ls-files -m | xargs)'
function gmb { git merge-base HEAD $1 }
alias gdm='git diff $(gmb master) HEAD'
alias be='bundle exec'
alias bi='bundle install --quiet'
alias pytest='python -m unittest discover'
alias weather='curl "http://wttr.in/Seattle"'

alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

alias passphrase='cd /usr/share/dict; for n in {1..10}; do for f in propernames connectives words words; do i=`od -vAn -N4 -tu4 < /dev/urandom`; let "j = $i%$(wc -l $f | xargs echo | cut -d\  -f1)"; head -$j $f| tail -1; done | xargs ; done; cd -'

alias de='docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti'
