if [[ "$(id -un)" == 'amcintosh3' ]];
then

    # Maven version used by TTO
    export M1_HOME="/usr/local/Cellar/maven/3.9.1"
    export PATH="${M1_HOME}/bin:${PATH}"

    # TTO Tomcat
    export JAVA_HOME=`/usr/libexec/java_home -v 11`
    export CATALINA_HOME="/usr/local/intuit_apache-tomcat"
    alias starttomcat='$CATALINA_HOME/bin/catalina.sh start'
    alias cdtomcat='cd $CATALINA_HOME'

    # A few tools
    alias what="$HOME/work/tools/what/node_modules/.bin/what-cli"
    alias kanban="$HOME/Personal/kanban/bin/kanban"
    alias notion="$HOME/Personal/notion/node_modules/.bin/notion-cli"

    alias yamlval="$HOME/work/tools/yaml-validation/bin/python -c 'import yaml, sys; print(yaml.safe_load(sys.stdin))' < $1"

    # Kubectl for IKS
    function switchenv {
        APP=$1;
        ENV=$2;
        SERVICE="service"

        if [[ $APP == "xmltrans" ]]; then
            THE_APP="xmltransform"
        elif [[ $APP == "tto24" ]]; then
            THE_APP="turbotaxonlinety24"
            SERVICE=""
        else
            THE_APP=$APP
        fi

        export KUBECONFIG="${HOME}/.kube/developer@canadatax-${THE_APP}${SERVICE}-usw2-${ENV}"
    }

fi
