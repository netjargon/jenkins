node('master'){
    
    
    stage('Prep'){
        checkout()
    }
    stage('Ant Build'){
        
        dir('Code/AntExample'){
            withEnv(["ANT_HOME=C:\\opt\\ant", "JAVA_HOME=C:\\Progra~2\\Java\\jdk1.8.0_111"]){
                "${ANT_HOME}\\bin\\ant"
            }
        }
    }
    stage('Archive Artifact'){
        println "testing web hooks"
        println "testing webhooks"
        println "testing multibranch pipelines"
        archiveArtifacts artifacts: 'SonarQube/AntExample/dist/AntExample.war', 
        fingerprint: true, 
        onlyIfSuccessful: true
    }
    stage('Pass Parameters'){
        

    }
}

checkout() {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]])
}