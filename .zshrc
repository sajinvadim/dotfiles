#Aliases
alias ls='ls --color=auto'
alias ll='ls -la'

alias awesome-cfg='sudo vim ~/.config/awesome/rc.lua'

#Mouting
alias diskwinmnt='sudo ntfs-3g -o ro /dev/sda1 /mnt/win'
alias diskwinumount='sudo umount /dev/sda1'

alias diskdatamnt='sudo ntfs-3g -o ro /dev/sda4 /mnt/data'
alias diskdataumount='sudo umount /dev/sda4'

#Network
alias ifup='sudo ip link set enp2s0 up'
alias ifdown='sudo ip link set enp2s0 down'

#Pacman
alias pacs='sudo pacman -S'
alias pacss='pacman -Ss'
alias pacup='sudo pacman -Syu'
alias pacr='sudo pacman -Rns'
alias pacc='sudo pacman -Scc' #Clear cache

#MPD
alias mpdstart='sudo systemctl start mpd.service'
alias mpdstop='sudo systemctl stop mpd.service'

alias player='ncmpc -c'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
bindkey -e
# End of lines configured by zsh-newuser-install


autoload -U compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select

#theme
prompt adam2


##############################################
#Bindings

typeset -A key

key[Home]="\e[7~"
key[End]="\e[8~"

key[Insert]="\e[2~"
key[Delete]="\e[3~"

key[Down]="\e[B"
key[Up]="\e[A"

key[Left]="\e[D"
key[Right]="\e[C"

key[PageUp]="\e[5~"
key[PageDown]="\e[6~"

#Setup keys

[[ -n "${key[Home]}"		]] && bindkey	"${key[Home]}"	    beginning-of-line
[[ -n "${key[End]}"		]] && bindkey	"${key[End]}"       end-of-line

[[ -n "${key[Insert]}"		]] && bindkey	"${key[Insert]}"    overwrite-mode
[[ -n "${key[Delete]}"		]] && bindkey	"${key[Delete]}"    delete-char

[[ -n "${key[Up]}"		]] && bindkey	"${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"		]] && bindkey	"${key[Down]}"      down-line-or-history

[[ -n "${key[Left]}"		]] && bindkey	"${key[Left]}"      backward-char
[[ -n "${key[Right]}"		]] && bindkey	"${key[Right]}"     forward-char

[[ -n "${key[PageUp]}"		]] && bindkey	"${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"	]] && bindkey	"${key[PageDown]}"  end-of-buffer-or-history



#Make sure terminal is in application mode.
#When zle is active - only then are the values of $terminfo valid

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }

    zle -N zle-line-init
    zle -N zle-line-finish
fi

