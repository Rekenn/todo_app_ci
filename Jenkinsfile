pipeline {
    agent { dockerfile true }
    environment {
        FLASK_APP = "project.py"
        DATABASE_URL = "mysql://${params.DB_USER}:${params.DB_PASSWORD}@${params.DB_SERVER_IP}/${params.DB_NAME}"
        SQLALCHEMY_TRACK_MODIFICATIONS = "False"
        JWT_SECRET_KEY = "secret"
    }
    stages {
        stage('Lint') {
            steps {
                sh 'pycodestyle --max-line-length=120 --ignore=E402,E128 .'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest'
            }
        }
    }
}
