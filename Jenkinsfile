pipeline {
    agent {
        label 'composer-docker' // ✅ bien dans la section agent
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

        stage("Docker build & push") {
            steps {
                sh "docker build . -t ${DOCKERHUB_USERNAME}/symfony_cicdcd"
                sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                sh "docker push ${DOCKERHUB_USERNAME}/symfony_cicdcd"
            }
        }
    }
}
