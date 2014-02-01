# zsh config script
# last updated 22 march 2012

autoload -U compinit promptinit
compinit
promptinit
 
#Set theme "prompt theme_name" 
prompt bart

autoload -U compinit
compinit

setopt completealiases

autoload -U colors && colors

eval "`dircolors -b ~/DIR_COLORS`" #let op type haakjes `  ` 

#Colored tab-completion list
zstyle ':completion:*' list-colors "$LS_COLORS"


######## ALIASES ######################
alias ls='ls --color=always'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cd..='cd ..'
alias ..='cd ..'
alias less='less -R'
alias grep='grep --color=always'
alias tree='tree -C'

# ls
alias lr='ls -R'                    # recursive ls
alias ll='ls -lh'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date

alias slow='slowdown'
alias ctl='systemctl'

#function ll {ls -lh "$1" | slowdown; }
#export -f ll

alias lls='ls -lh | slow'


# modified commands
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'


alias mathematica='/usr/local/Wolfram/Mathematica/7.0/Executables/./Mathematica'
alias rosetta='wine .wine/drive_c/Program\ Files/Rosetta\ Stone/Rosetta\ Stone\ Version\ 3/RosettaStoneVersion3.exe'
alias wenlin='wine /home/bernie/.wine/drive_c/Program\ Files/Wenlin3/wenlin.exe'
alias maple='~/maple13/bin/./maple'
alias cl='/iraf/iraf/unix/hlib/./ecl.csh'
alias mpd='mpd ~/.mpd/conf'
alias scanit='scanimage -p -v  --mode col --swcrop=yes --resolution 300 >' #Usage: 'scan outputfilename.ext'
alias screenshot='import -window root -quality 90 -pause 2' #Usage: 'screenshot outputfilename.ext'
alias svim='sudo vim'
alias volume='alsamixer'
alias backup='sudo /home/bernie/./backup.sh'
alias actmdb='source /home/bernie/mdb/bin/./activate'
alias traffic='speedometer.py -i 1.0 -l -m 1000000 -n 1 -r eth0 -t eth0'


PATH=$PATH:/usr/local/bin
export PATH

export MPD_HOST=/home/bernie/.mpd/socket
export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE="ibus"


function say { mplayer -really-quiet "http://translate.google.com/translate_tts?tl=en&q=$1"; }
function saynl { mplayer -really-quiet "http://translate.google.com/translate_tts?tl=nl&q=$1"; }


######################
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char # Del
###################################

source /home/bernie/pyenvs/django/bin/activate
#source ~/zshsyntax/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

args() {
    print $#
    print $*
    
  }







