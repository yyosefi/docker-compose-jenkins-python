pipeline {
    agent any
 
    options {
        skipDefaultCheckout(true)
    }
 
    stages {
        stage('Checkout SCM') {
            steps {
                echo '> Checking out the source control ...'
                checkout scm
            }
        }
        stage('python06') {
            steps {
                echo 'test 06'
                sh '/usr/bin/python3 main.py'
            }
        }

    }
}
