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
        stage('Run Python script') {
            steps {
                sh '/usr/bin/python3 main.py'
            }
        }

    }
}
