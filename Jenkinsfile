pipeline{
    agent any
    
   
    stages {
        
      

        stage("Build"){
            steps{
                echo "running"
                sh '''
                    
                    sudo ssh -i /var/lib/jenkins/test.pem -t -o StrictHostKeyChecking=no ubuntu@ec2-54-152-119-164.compute-1.amazonaws.com
                    cd /var/www/
                    sudo rm -rf html
                    sudo mkdir html
                    cd html
                    sudo git init
                    sudo git config --global --add safe.directory /var/www/html
                    sudo git remote add origin https://github.com/cent-kanayo/new-test-jenkins.git
                    sudo git pull origin main
                   
                '''
            }
        }
          
        stage('Test') {
            steps {
                echo 'Testing..'
                
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh '''
                    sudo docker run -d -p 4040:80 --name html httpd
                '''
            }
        }
    }
}
