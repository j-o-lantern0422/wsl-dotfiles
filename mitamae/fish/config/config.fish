#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

abbr -a g git
abbr -a gc 'git commit -m '
abbr -a gs 'git switch -c'
abbr -a gc 'git checkout'
abbr -a gp git push origin
abbr -a be bundle exec
abbr -a bi bundle install
abbr -a dcm docker-compose


#repoってするとpecoがリポジトリの一覧を出してくれて、選んだらそこに移動する
alias repo='cd (ghq root)/(ghq list | peco)'
# sshの設定ファイルを見てHost設定されてるところをpecoが出す
#alias ssh='ssh $(grep "^Host" ~/.ssh/config|peco|awk "{print \$2}")'

# その他ショートカットしたいだけ
alias gg="ghq get"

# ローカルリポジトリのいらないブランチを消す（リモートに合わせる）
alias gf="git fetch origin --prune"
alias gc="git checkout (git branch | peco | tr -d ' ' | tr -d '*')"

# history | peco
alias hist="history | peco"

##### git alias #######

alias gclean=" git fetch origin --prune & git branch --merged | egrep -v '\*|develop|master' | xargs git branch -d"
alias gcm="git checkout master"

#### docker alias ###########
alias docker-clean='docker volume rm (docker volume ls -qf dangling=true) '


# Color Setting
alias ls='ls -G'
alias ll='ls -hl'

alias cat='bat --paging never'

alias copy="win32yank.exe -i"

source ~/.asdf/asdf.fish
