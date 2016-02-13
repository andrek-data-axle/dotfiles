alias vi='nvim'
alias nvi='nvim'
alias ls='ls -G'
alias lt='ls -lhtr'
alias ltt='ls -lhtr | tail'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color | head'
alias ggl='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gs='git status -s'
alias be='bundle exec'
alias pytest='python -m unittest discover'

# function passphrase { cd /usr/share/dict; for n in {1..10}; do for f in propernames connectives words words; do i=`od -vAn -N4 -tu4 < /dev/urandom`; let "j = $i%$(wc -l $f | awk '{print $1}')"; head -$j $f| tail -1; done; done | xargs; cd - }

