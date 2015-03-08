# ファイルを作るとき、どんな属性で作るか。man umask 参照
umask 022

# Keybind vim|emacs
bindkey -e

# グロッビングの拡張
setopt EXTENDED_GLOB

# cd するときに、自動でプッシュする
setopt AUTO_PUSHD

# 重複したPUSHDリストは消す
setopt PUSHD_IGNORE_DUPS

# ディレクトリ名だけで移動できる。
setopt AUTO_CD

# rm * を実行する前に確認される。
#setopt RMSTAR_WAIT

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
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY

# 全履歴の一覧を出力する
function history-all { history -E 1 }

# 履歴の共有
setopt SHARE_HISTORY

# 履歴のインクリメンタル検索
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# ヒストリの最初の空白を除く
setopt HIST_IGNORE_SPACE

# ビープ音を鳴らさないようにする
setopt NO_BEEP

# Ctrl-D でログアウトするのを抑制する
setopt IGNORE_EOF

# ^Q/^S のフローコントロールを無効にする
setopt NO_FLOW_CONTROL

# Prompt decoration
local Cname=$'%{\e[0;0m%}'
local Cdict=$'%{\e[0;0m%}'
local Cprom=$'%{\e[0;34m%}'
local DEFAULT=$'%{\e[0;0m%}'
PROMPT="$Cname$USER$Cprom@%m:[$Cdict%~$Cprom]$DEFAULT$ "

# Plugin Setting
# Antigen
if [[ $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
#  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-completions src
  antigen bundle mollifier/anyframe
  antigen apply
fi

# add-zsh-hook
autoload -Uz add-zsh-hook

# 補間機能
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=2
zstyle '.completion:*' matcher-list 'm:{a-z}={A-Z}'

# history-search-end
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey '^o' history-beginning-search-backward-end

# 単語の区切り設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# zmv
autoload -Uz zmv

# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
function _update_vcs_info_msg() {
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# インクリメンタルコマンド検索
bindkey '^x^r' anyframe-widget-put-history

# 最近移動したディレクトリに移動する
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recnet-dirs-max 200
# pecoで絞り込み
bindkey '^xb' anyframe-widget-cdr

# Alias
alias ls='ls -G'
alias ll='ls -lG'
alias zmv='noglob zmv -W'

