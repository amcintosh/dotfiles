if [[ "$(id -un)" == 'amcintosh3' ]];
then

    # Maven version used by TTO
    export M1_HOME="/usr/local/Cellar/maven/3.9.1"
    PATH="${M1_HOME}/bin:${PATH}"
    export PATH

    # Rancher Desktop
    export PATH="$HOME/.rd/bin:$PATH"

    # TTO Tomcat
    export CATALINA_HOME=/usr/local/intuit_apache-tomcat
    alias starttomcat='$CATALINA_HOME/bin/catalina.sh start'
    alias cdtomcat='cd $CATALINA_HOME'

    # A few tools
    alias what="$HOME/work/tools/what/node_modules/.bin/what-cli"
    alias kanban="$HOME/Personal/kanban/bin/kanban"
    alias notion="$HOME/Personal/notion/node_modules/.bin/notion-cli"

fi
