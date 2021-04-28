pipeline {

    agent { 
        node {
            label 'Packer'
        }
    }


    options {
        ansiColor('xterm')
    }

    stages {
        
        stage ('Start') {
            steps {
                // send build started notifications
                //slackSend (channel: '#build-notifications', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' ${env.BUILD_URL}")
                echo "blah"
            }
        }    

        stage('Clean Workspace') {
            steps {
                dir("${WORKSPACE}") {
                    deleteDir()
                }
            }
        }


        stage('Download Code') {
            steps {
                dir ("${WORKSPACE}/packer"){
                    git branch: 'develop', credentialsId:'GithubToken', url: "https://github.com/sce81/pkr-build-consul.git"
                }

            }
        }

  
        stage('Packer Build'){
            steps {
                script{
                    dir ("${WORKSPACE}/packer"){
                    sh "packer build . | tee build.log"
                    sh "tail -1 build.log |  rev | awk '{print \$1}' | rev > artifact.txt"
                        }
                }
            }
        }
                            
                            
        stage('Cleanup') {
            steps {
                dir("${WORKSPACE}") {
                    deleteDir()
                }
            }
        }
    }
    // stages                    
}


