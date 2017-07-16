node('master'){
    stage('Test Environment Variables'){
        println "${env.ANT_HOME}"
        println "${env.SONAR_HOME}"
    }
    stage('test'){
        ws('SonarTest'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]]) 
        
        def sonarTool = tool 'sonar';
        withSonarQubeEnv('sonarQube Server'){            
          sonarTool

            }
        }
        
    
    }

}