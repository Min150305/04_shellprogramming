# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias c='clear'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi



# Sfecific configuration
#
#export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
export PS1='\[\e[31;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'


#
# DNS Server Alias
#
alias named.conf='vi /etc/named.conf'
alias named.rfc1912.zones='vi /etc/named.rfc1912.zones' 
alias DNS='cd /var/named'
alias dnslog='tail -f /var/log/messages'
alias vi='/usr/bin/vim'

alias df='df -h -T'

#
# vscode
#
alias vscode='code --no-sandbox --user-data-dir ~/workspace'
alias vv='chmod 700 /root/bin/*.sh'
alias cc='cd /root/scripts/'
alias svcstart='svc.sh start $1'
alias svcstop='svc.sh stop $1'

PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/scripts
