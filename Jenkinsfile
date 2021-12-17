pipeline {
    agent any
     environment {
      BRANCH_NAME = "${GIT_BRANCH.split("/")[0]}"
     }

    stages {
        stage('print branch name') {
            steps {
                script {
                    if(BRANCH_NAME == "main) {
                          stage ('Stage 1') {
                            echo BRANCH_NAME 
                        }
                        
                    }
                }
               
            }
        }
    }
}
