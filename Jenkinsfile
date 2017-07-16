node('master'){
    stage('test'){
        ws('SonarTest'){
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]]) 
        
     
        withSonarQubeEnv('sonar'){
            def sonarTool = tool 'sonar'
            println "${sonarTool}"
            println "testing .gitignore file"

            dir('AntExample'){
                    ${sonarTool} ant sonar
                }
            }
        }
        
    
    }

}