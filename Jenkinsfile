pipeline {
    agent any
     environment {
      BRANCH_NAME = "${GIT_BRANCH.split("/")[0]}"
     }

    stages {
        stage('print branch name') {
            steps {  
                    if(BRANCH_NAME == "main") {
                          echo BRANCH_NAME 
                      }
                        
                 }
               
        }
    }
}
