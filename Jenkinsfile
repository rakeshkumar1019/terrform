pipeline {
    agent any
     environment {
      BRANCH_NAME = "${GIT_BRANCH.split("/")[0]}"
     }

    stages {
        stage('print branch name') {
            steps {   
                script{
                      if(BRANCH_NAME == "main") {
                          echo "main" 
                      }
                      if(BRANCH_NAME == "development") {
                          echo "development"
                      }
                      if(BRANCH_NAME == "staging") {
                          echo "staging"
                      }
                }
                    
                        
             }
               
        }
    }
}
