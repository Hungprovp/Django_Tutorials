pipeline {
    agent none
    stages {     
        stage('Maven Install') {
        agent {         
            docker {          
                image 'maven:3.5.0'         
            }       
        }       
        steps {
            sh 'mvn clean install'
            }
        }
    },
    stage('Docker Build') {
        agent any
        steps {
            sh 'docker build -t hth_group .'
            sh "ls -l /usr/bin/docker || echo 'Docker binary missing'"
            sh "ls -l /var/run/docker.sock || echo 'Docker socket missing'"
        }
    }
}
