node('master'){
    stage('test'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'jgit', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]]) 
        println 'Hello Jenkins File'
        println 'Testing git within Visual Studio Code'
        println 'Trying again'
        println 'checking again'
    }
    stage('Android build'){
        println 'Building the docker container'
        
    }

    // stage('Nexus Artifact'){
    // 	nexusArtifactUploader credentialsId: '1116cf17-90d7-44e5-aba7-d95ca6662541', groupId: 'docktest', nexusUrl: 'localhost:3032/nexus', nexusVersion: 'nexus2', protocol: 'http', repository: 'thirdparty', version: '1'

        
    // }
    stage('Environment Testing'){
        sh "env > env.txt"
        for (String i : readFile('env.txt').split("\r?\n")) {
            println i
        }
    }

}

