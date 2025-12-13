if [[ "$(id -un)" == 'amcintosh3' ]];
then

    # Maven version used by TTO
    export M1_HOME="/usr/local/Cellar/maven/3.9.1"
    export PATH="${M1_HOME}/bin:${PATH}"

    # TTO Tomcat
    export JAVA_HOME=`/usr/libexec/java_home -v 25`
    export CATALINA_HOME="/usr/local/intuit_apache-tomcat"
    alias starttomcat='$CATALINA_HOME/bin/catalina.sh start'
    alias cdtomcat='cd $CATALINA_HOME'

    # A few tools
    alias what="$HOME/work/tools/what/node_modules/.bin/what-cli"
    alias kanban="$HOME/Personal/kanban/bin/kanban"
    alias notion="$HOME/Personal/notion/node_modules/.bin/notion-cli"
    alias pod-tools="$HOME/work/tools/pod-tools/.venv/bin/pod-tools"

    alias tto_format="mvn com.spotify.fmt:fmt-maven-plugin:format"
    alias yamlval="$HOME/work/tools/yaml-validation/bin/python -c 'import yaml, sys; print(yaml.safe_load(sys.stdin))' < $1"

    # Kubectl for IKS
    function switchenv {
        APP=$1;
        ENV=$2;
        REGION="usw2"
        SERVICE="service"

        if [[ $ENV == "prod" ]] || [[ $ENV == "prd" ]]; then
            ENV="prd"
            REGION="use2"
        elif [[ $ENV == "pref" ]] || [[ $ENV == "prf" ]]; then
            ENV="prf"
            REGION="use2"
        fi

        if [[ $APP == "xmltrans" ]] || [[ $APP == "xml" ]]; then
            THE_APP="xmltransform"
        elif [[ $APP == "bi" ]]; then
            THE_APP="turbotaxonlineanalytics"
            SERVICE=""
        elif [[ $APP == "tto24" ]]; then
            THE_APP="turbotaxonlinety24"
            SERVICE=""
        elif [[ $APP == "tto25" ]]; then
            THE_APP="turbotaxonlinety25"
            SERVICE=""
        else
            THE_APP=$APP
        fi

        cp "${HOME}/.kube/developer@canadatax-${THE_APP}${SERVICE}-${REGION}-${ENV}" "${HOME}/.kube/config"
        export KUBECONFIG="${HOME}/.kube/developer@canadatax-${THE_APP}${SERVICE}-${REGION}-${ENV}"
    }

fi
