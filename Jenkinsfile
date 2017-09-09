


node('master'){
    properties([[$class: 'CopyArtifactPermissionProperty', projectNames: 'test'], pipelineTriggers([])])
    
    stage('Prep'){
        checkout()
        
    }
    stage('Ant Build'){
        
        dir('Code/AntExample'){
            withEnv(["ANT_HOME=/usr/local/bin/ant", "JAVA_HOME=/usr/bin/java"]){
                "${ANT_HOME}"
            }
        }
    }
    stage('Archive Artifact'){
        println "testing web hooks"
        println "testing webhooks"
        println "testing multibranch pipelines"
        archiveArtifacts artifacts: '*.war', 
        fingerprint: true, 
        onlyIfSuccessful: true
    }
    stage('Docker Build'){
        build job: 'test', wait: false

    }
}

def checkout() {
    checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]])
}
