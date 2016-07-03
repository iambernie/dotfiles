#  zsh config script

autoload -U compinit && compinit

# set this (autoload -U colors && colors) before PROMPT declaration.
# it enables variables such as
# $fg[red], $fg[white], etc..
autoload -U colors && colors

setopt completealiases

#============================  To set a prompt theme  ========================#
#autoload -U promptinit
#promptinit
#Set theme "prompt theme_name"
#prompt bart

#=============================  git aware prompt  ===============================#
parse_git_branch () {
    git branch 2> /dev/null | grep "*" | sed -e 's/* \(.*\)/ (\1)/g'
}

function precmd() {
    export PS1="%{$fg[red]%}%n @ %m%{$reset_color%}: %{$fg[green]%}%~%{$fg[yellow]%}$(parse_git_branch)%{$reset_color%}%# "
}

#============================   LS_COLORS   ===================================#
#
# Attribute codes:
# # 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
#
# # Text color codes:
# # 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
#
# # Background color codes:
# # 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#
# no = (NORMAL)                  normal
# fi = (FILE)                    regular file
# rs = (RESET)                   reset
# ln = (LINK)                    symbolic link
# pi = (FIFO)                    pipe
# so = (SOCK)                    socket
# do = (DOOR)                    door
# bd = (BLK)                     block device driver
# cd = (CHR)                     character device driver
# or = (ORPHAN)                  symlink to non-existing file
# su = (SETUID)                  file that is setuid (u+s)
# sg = (SETGID)                  file that is setuid (g+s)
# ca = (CAPABILITY)              file with capability
# tw = (STICKY_OTHER_WRITABLE)   dir that is sticky with (+t, o+w)
# ow = (OTHER_WRITABLE)          dir that is (o+w) but no sticky
# st = (STICKY)                  dir with the sticky bit set (+t)
# ex = (EXEC)                    executable

export LS_COLORS="no=00:fi=00:rs=0:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:\
bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=01;34:\
ow=34;40:st=37;40:ex=01;32:\
*.tar=00;31:*.tgz=00;31:*.zip=00;31:*.gz=00;31:*.xz=00;31:*.bz2=00;31:\
*.bz=00;31:*.rar=00;31:*.7z=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:\
*.bmp=00;35:*.tga=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.svg=00;35:\
*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.mkv=00;35:*.ogm=00;35:*.mp4=00;35:\
*.m4v=00;35:*.wmv=00;35:*.asf=00;35:*.rm=00;35:*.rmvb=00;35:*.flc=00;35:\
*.avi=00;35:*.flv=00;35:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mp3=00;36:\
*.ogg=00;36:*.wav=00;36:*.py=01;32:*.gpg=01;36:"

export MPD_HOST=/home/bernie/.mpd/socket
export GTK_IM_MODULE="ibus"
export XMODIFIERS="@im=ibus"
export QT_IM_MODULE="ibus"
export EDITOR=vim

#Colored tab-completion list
zstyle ':completion:*' list-colors "$LS_COLORS"

#================================  Aliases  ===================================#
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cd..='cd ..'
alias ..='cd ..'
#alias less='less -R'
alias grep='grep --color=always'
alias tree='tree -C'

alias ls='ls --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -lh'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date

alias du='du -c -h'
alias mkdir='mkdir -p -v'

alias scanit='scanimage -p -v  --mode col --swcrop=yes --resolution 300 >' #Usage: 'scan outputfilename.ext'
alias lockscreen='xscreensaver-command --lock'

alias sa='echo "$SSH_AUTH_SOCK"'
alias startx='ssh-agent startx'

#==============================  Key Bindings =================================#
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

#======================  Aliases - Virtual Environments  ======================#
alias p2='source $HOME/pyenvs/p2/bin/./activate'

#==========================  Coloured Manuals  ================================#
man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;34m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;31m") \
  man "$@"
}

#========================== Misc. functions ===================================#

function reload { source $HOME/.zshrc; echo 'Loaded: ~/.zshrc ' }

