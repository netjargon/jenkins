node('master'){
    stage('test'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'jgit', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]]) 
        println 'Hello Jenkins File'
        println 'Testing git within Visual Studio Code'
        println 'Trying again'
        println 'checking again'
    }
}

