pipeline {
    agent { dockerfile true }
    stages {
        }
        stage('Test') {
            steps {
                sh 'pytest'
                sh 'pycodestyle --max-line-length=120 --ignore=E402,E128 .'
            }
        }
    }
}
