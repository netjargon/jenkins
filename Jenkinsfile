node('master'){
    stage('Test Environment Variables'){
        println "${env.ANT_HOME}"
        println "${env.SONAR_HOME}"
    }
    stage('Sonar Analysis'){
    withEnv(['JAVA_HOME=C:\\Progra~2\\Java\\jdk1.8.0_111', 'ANT_HOME=C:\\opt\\ant']) {
    // some block
    ws('SonarTest'){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], gitTool: 'Default', submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'b7a9e21ffc0d6874b83e9a9d7d507644', url: 'https://github.com/netjargon/jenkins.git']]])    
        def sonarTool = tool 'sonar';
        withSonarQubeEnv('sonarQube Server'){
                bat "${sonarTool}/bin/sonar-scanner.bat"
                    }
                }
            }
        }
    }
    stage('Sonar Quality Gates'){
    timeout(time: 1, unit: 'MINUTES'){
        def qualityGate = waitForQualityGate()
        if (qualityGate.status != 'OK'){
            error "Pipeline aborted due to qualify gate failure: ${qualityGate.status}"
            }
        else{
            println "Status is Success!"
            }
        }
    }