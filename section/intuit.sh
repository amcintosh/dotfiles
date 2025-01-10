if [[ "$(id -un)" == 'amcintosh3' ]];
then

    # Maven version used by TTO
    export M1_HOME="/usr/local/Cellar/maven/3.9.1"
    PATH="${M1_HOME}/bin:${PATH}"
    export PATH

    # TTO Tomcat
    export CATALINA_HOME=/usr/local/intuit_apache-tomcat
    alias stoptomcat='$CATALINA_HOME/bin/catalina.sh stop'
    alias starttomcat='$CATALINA_HOME/bin/catalina.sh start'
    alias cdtomcat='cd $CATALINA_HOME'

fi
