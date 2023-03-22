pipeline {
    agent any
 
    options {
        skipDefaultCheckout(true)
    }
 
    stages {
        stage('python06') {
            steps {
                echo 'test 06'
                sh '/usr/bin/python3 main.py'
            }
        }
//         stage('Checkout SCM') {
//             steps {
//                 echo '> Checking out the source control ...'
//                 checkout scm
//             }
//         }

    }
}
