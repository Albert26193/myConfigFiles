# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM=xterm-256color
#export TERM=rxvt-unicode-256color

source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh

# 加载原版oh-my-zsh中的功能
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle z
antigen bundle paulirish/git-open
antigen bundle autojump
antigen bundle vscode
antigen bundle extract
antigen bundle colored-man-pages
antigen bundle zsh-history-substring-search

# 语法高亮功能
antigen bundle zsh-users/zsh-syntax-highlighting

# 代码提示功能
antigen bundle zsh-users/zsh-autosuggestions

# 自动补全功能
antigen bundle zsh-users/zsh-completions

# 加载主题
antigen theme romkatv/powerlevel10k

# antigen bundle makeitjoe/incr

# 保存更改
antigen apply

# 手动安装incr
# source ~/.oh-my-zsh/plugins/incr*.zsh

# 屏幕动画
# screenfetch -t 
toilet -f mono9 -F border -t BugFree --rainbow

xrandr --output DP-0 --primary

# figlet -t ArchLinux 
#RED="\e[31m"
#ORANGE="\e[33m"
#BLUE="\e[96m"
#GREEN="\e[92m"
#STOP="\e[0m"

#printf "${BLUE}"
#printf "==========================================================\n"
#printf "${GREEN}"
#figlet -w 60 -f standard "ARCH LINUX"
# printf "${BLUE}"
# figlet -w 120 -f  small "CLI Operational System"
#printf "${BLUE}"
#printf "==========================================================\n"
#printf "${STOP}"


# 自定义p10k主题
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# vim mode
bindkey -v

# alias
alias       ty="typora"
alias 		  vi="vim"
alias 		  nv="nvim"
alias langtocn="LANG=zh_CN.UTF-8"
alias langtoen="LANG=en_US.UTF-8"
alias 	   fig="figlet"
alias 		  vs="code"
alias 	chrome="google-chrome-stable --proxy-server=socks5://127.0.0.1:1089"
alias  piproxy="export http_proxy='pi.local:8118' https_proxy='pi.local:8118'"
alias 		  za="zathura"
alias       hd="sudo ntfs-3g /dev/sda2 ~/HDD/HDD_1"

# function
# --- open the proxy edited by Albert ---
function proxy_on() {
		export http_proxy="http://127.0.0.1:20171"
		export https_proxy="http://127.0.0.1:20171"
		echo "already turn on the proxy"
}

function proxy_off() {
		unset http_proxy
		unset https_proxy
		echo "already turn off the proxy"
}

function weather() {
	curl 'wttr.in/Shanghai?format=4'
}
