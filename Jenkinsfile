pipeline {
    agent {
        dockerfile {
            args '-v ${WORKSPACE}:/ws -v x15-volume:/ws/x15'
        }
    }
    stages {
        stage('Fetch') {
            steps {
                checkout scm
                sh '/ws/scripts/fetch.sh'
            }
        }
        stage('Build') {
            steps {
                sh '/ws/scripts/build.sh'
            }
        }
        stage('Package') {
            steps {
                sh 'mkdir /ws/output/'
                sh 'cp /ws/x15/build/tmp/deploy/images/beagle-x15/core-image-minimal-beagle-x15.wic.bmap /ws/output/'
                sh 'cp /ws/x15/build/tmp/deploy/images/beagle-x15/core-image-minimal-beagle-x15.wic.xz /ws/output/'
                sh 'tar cf /ws/x15-image.$(basename ${GIT_BRANCH})-b${BUILD_NUMBER}-c${GIT_COMMIT} /ws/output/'
                sh 'md5sum /ws/x15-image* > /ws/x15-image.$(basename ${GIT_BRANCH})-b${BUILD_NUMBER}-c${GIT_COMMIT}.md5'
            }
        }
        stage('Deploy') {
            steps {
                sshagent(credentials : ['06923055-62f3-4e61-a366-9a138ec74015']) {
                    sh '''
                        [ -d ~/.ssh ] || mkdir ~/.ssh && chmod 0700 ~/.ssh
                        ssh-keyscan -t rsa,dsa ahepp.dev >> ~/.ssh/known_hosts
                        ssh root@ahepp.dev "ssh-keyscan -t rsa,dsa www.lan" >> ~/.ssh/known_hosts
                        scp -J root@ahepp.dev /ws/x15-image* root@www.lan:/usr/local/www/x15/
                    '''
                }
            }
        }
        stage('Clean') {
            steps {
                sh 'rm -r /ws/output'
                sh 'rm /ws/x15-image*'
            }
        }
    }
}
