export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

export ZSH=/Users/zan9/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/bin:$PATH
fpath=(/usr/local/share/zsh-completions $fpath)
#ZSH_THEME="dracula"
ZSH_THEME="af-magic"
# User configuration
source $ZSH/oh-my-zsh.sh

# zhs-completions
fpath=(/usr/local/share/zsh-completions $fpath)
# 文字コードの指定
export LANG=ja_JP.UTF-8
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# cdなしでディレクトリ移動
setopt auto_cd
# ビープ音の停止
setopt no_beep
# ビープ音の停止(補完時)
setopt nolistbeep
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd
# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# キーバインディン(vim風)
 
# zsh-completionsの設定
 
autoload -U compinit
compinit -u

export PATH="$HOME/.rbenv/bin:$PATH"



#fasdの起動、これはプラグインではなくbrewでinstall

eval "$(fasd --init auto)"

#peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

alias v="vim"
alias x="tmux"
alias g="git"

alias be='bundle exec'
alias r="rails"
alias rs='rails server'
alias rc='rails console'
alias rg='rails generate'
alias berm="bundle exec rake db:migrate"
alias rspec="rspec -fd"
alias b='bundle'

alias ct="`brew --prefix`/bin/ctags"
alias ls="exa"
alias la="exa -la"
alias his="history"
alias ag='ag --pager="less -R"'

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

