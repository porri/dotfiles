# base-files version 3.9-3

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# Environment Variables
# #####################

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
export TMP=/cygdrive/c/tmp/
# export TEMP=/tmp

# Or use TMPDIR instead
# export TMPDIR=/tmp

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Larger bash history (allow 32� entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
# Keep the times of the commands in history.
export HISTTIMEFORMAT='%F %T '



# Aliases
# #######



# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
#alias grep='grep --color'                     # show differences in colour
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

#alias ls='ls -hF --color=tty'                 # classify files in colour
#alias ls="BLOCK_SIZE=\'1 ls --color=auto" #enable thousands grouping and colour
alias ls="BLOCK_SIZE=\'1 ls -hF --color=tty" #enable thousands grouping and colour

# Some shortcuts for different directory listings
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
#alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #


alias ..="cd .."        #go to parent dir
alias ...="cd ../.."    #go to grandparent dir
alias -- -="cd -"       #go to previous dir
alias l.='ls -d .*'     #list hidden files
alias ll='ls -lhrt'     #extra info compared to "l"
alias lld='ls -lUd */'  #list directories

# Functions
# #########

# Some example functions
function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}


#export DISPLAY=:0.0
#cd /cygdrive/c/

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##https://github.com/scottjehl/dotfiles/blob/master/.bash_profile

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don�t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
    done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
#Original
#[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
#Arnold
[ -e "$HOME/.ssh/known_hosts" ] && complete -o "default" -o "nospace" -W "$(cat  ~/.ssh/known_hosts | grep -v "[?*]" | cut -d " " -f1 | cut -d "," -f1)" scp sftp ssh




# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi