#My usual 'ls' alias
alias lsl='ls -lh'
alias df='df -h'

#Some helpful stuff
alias more='less'
alias ping='ping -c 5'


#Set keyboard controls on
alias mpg123='mpg123 -C'

#Alias to use dev todo.txt rather than todo.txt
alias todotest='/home/andrew/work/todo.txt-cli/todo.sh -d /home/andrew/work/todo.txt-cli/todo.cfg'

function t() {
   if [ $# -eq 0 ]; then
      todo.sh -d ~/.todo.cfg ls
   else
      todo.sh -d ~/.todo.cfg $*
   fi
}

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


