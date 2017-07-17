node('master'){
    
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
//     stage('Sonar Quality Gates'){
// //    timeout(time: 20, unit: 'SECONDS'){
//         def qualityGate = waitForQualityGate().status
//         println "${qualityGate}"
//         switch(qualityGate){
//                 case qualityGate == 'SUCCESS':
//                 println "Quality Gate is ${qualityGate}"
//                 case qualityGate == 'OK':
//                 println "Quality Gate is OK"
//                 case qualityGate == 'PENDING':
//                 println "QualityGate is PENDING and I don't know why"
//                 case qualityGate == 'IN_PROGRESS':
//                 println "Quality Gate is in progress and it is frustrating!"
//                 default:
//                 error "Quality Gate was not OK"
//             }
//         //}
//     }