source ~/.zplug/init.zsh

zplug "themes/wedisagree",   from:oh-my-zsh

# テーマファイルを読み込む
#zplug 'dracula/zsh', as:theme

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

export PATH="/Users/yama/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/yama/Library/Android/sdk/platform-tools"
# export MANPATH="/usr/local/man:$MANPATH"


if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:/Library/TeX/texbin

function chpwd() { ls }

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

alias be='bundle exec'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
