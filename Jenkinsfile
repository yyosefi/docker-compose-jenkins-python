pipeline {
    agent any
 
    options {
        skipDefaultCheckout(true)
    }
 
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                sh 'python main.py'
            }
        }
        stage('Checkout SCM') {
            steps {
                echo '> Checking out the source control ...'
                checkout scm
            }
        }
        stage('Hola') {
            steps {
                echo '> Hola 03 ...'
            }
        }
    }
}
