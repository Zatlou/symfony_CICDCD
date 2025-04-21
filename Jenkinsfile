pipeline {
    agent {
        label 'composer-docker'
    }

    environment {
        DOCKERHUB_USERNAME = "zatlou"
        DOCKERHUB_PASSWORD = credentials('d70d768c-9bea-4862-ab7b-3f213eafb380')
    }

    stages {
        stage("CI") {
            steps {
                git branch: "main", url: "https://github.com/Zatlou/symfony_CICDCD"
                sh "composer install --no-interaction --prefer-dist"
            }
        }

        stage('Docker build & push') {
            steps {
                sh "docker build . -t ${DOCKER_CREDS_USR}/symfony_cicdcd:latest"
                sh "echo ${DOCKER_CREDS_PSW} | docker login -u ${DOCKER_CREDS_USR} --password-stdin"
                sh "docker push ${DOCKER_CREDS_USR}/symfony_cicdcd:latest"
            }
        }

    }
}
