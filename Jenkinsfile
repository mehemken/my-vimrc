pipeline {
    agent any
    triggers {
        pollSCM 'H/10 * * * *'
    }
    stages {
        stage('build') {
            steps {
                sh echo 'hello world'
                sh pwd
		sh ls
            }
        }
    }
}

