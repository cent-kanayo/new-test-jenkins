pipeline{
    agent any
    
   
    stages {
        
      

        stage("Build"){
            steps{
                echo "running"
                sh '''
                    
                    sudo ssh -i /var/lib/jenkins/test.pem -t -o StrictHostKeyChecking=no ubuntu@ec2-54-152-119-164.compute-1.amazonaws.com
                    cd /var/www/html
                    sudo git init
                    sudo git config --global --add safe.directory /var/www/html
                    sudo git remote add origin https://github.com/cent-kanayo/new-test-jenkins.git
                    sudo git pull origin main
                    sudo apt-get update
                    sudo apt-get install \
                            ca-certificates \
                            curl \
                            gnupg \
                            lsb-release -y
                    sudo mkdir -p /etc/apt/keyrings
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                     echo \
                        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

                    sudo apt-get update
                    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
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
                    sudo docker run -d -v -p 4040:80 --name html httpd
                '''
            }
        }
    }
}
