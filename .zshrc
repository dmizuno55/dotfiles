# ファイルを作るとき、どんな属性で作るか。man umask 参照
umask 022
# 補間機能
autoload -U compinit
compinit
# Ctrl-D でログアウトするのを抑制する
setopt IGNORE_EOF
# グロッビングの拡張
setopt EXTENDED_GLOB
# cd するときに、自動でプッシュする
setopt AUTO_PUSHD
# 重複したPUSHDリストは消す
setopt PUSHD_IGNORE_DUPS
# ディレクトリ名だけで移動できる。
setopt auto_cd
# rm * を実行する前に確認される。
#setopt rmstar_wait
# Grip などGlibアプリケーション出力での文字化け防止
export G_FILENAME_ENCODING=@locale
# stack size
ulimit -s unlimited
# 履歴をファイルに保存する
HISTFILE=$HOME/.zsh_history
# メモリ内の履歴の数
HISTSIZE=100000
# 保存される履歴の数
SAVEHIST=100000
# 履歴ファイルに時刻を記録
setopt append_history
setopt extended_history
# 全履歴の一覧を出力する
function history-all { history -E 1 }
# 履歴の共有
setopt share_history
# ヒストリの最初の空白を除く
setopt HIST_IGNORE_SPACE
# ビープ音を鳴らさないようにする
setopt NO_beep
# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
esac

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# Keybind vim|emacs
bindkey -e

# Prompt decoration
local Cname=$'%{\e[0;0m%}'
local Cdict=$'%{\e[0;0m%}'
local Cprom=$'%{\e[0;34m%}'
local DEFAULT=$'%{\e[0;0m%}'
PROMPT="$Cname$USER$Cprom@%m:[$Cdict%~$Cprom]$DEFAULT$ "
#PROMPT='%D %T %(!.#.$) [%~] '
#RPROMPT='[%~]'

preexec () {
##  PROMPT='%D %T %(!.#.$) '
##   RPROMPT='[%~]'
##    if [ $TERM = "screen" ]; then
##        1="$1 " # deprecated.
##        echo -ne "\ek${${(s: :)1}[0]}\e\\"
##    fi
}


[[ $TERM = "eterm-color" ]] && TERM=xterm-256color
[[ $EMACS = t ]] && unsetopt zle

export LC_ALL="ja_JP.UTF-8"
export NODE_VERSION='v0.10.21'
export NVM_HOME=/usr/local/nvm

export JAVA_HOME="$(/usr/libexec/java_home)"


export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share:$NVM_HOME/$NODE_VERSION/bin:$PATH
export NVM_MODULE=$NVM_HOME/$NODE_VERSION/lib/node_modules
export NODE_PATH=$NVM_HOME/$NODE_VERSION:$NVM_MODULE

export EDITOR=emacsclient
export VISUAL=emacsclient
export PORT=5000

# renv
eval "$(rbenv init -)"


alias E='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

