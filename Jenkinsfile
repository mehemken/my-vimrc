pipeline {
    agent any
    triggers {
        pollSCM 'H/10 * * * *'
    }
    stages {
        stage('build') {
            steps {
                echo 'hello world'
                pwd
		ls
            }
        }
    }
}

