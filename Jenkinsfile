pipeline{
    agent any
    
   
    stages {
        
      

        stage("Build"){
            steps{
                echo "running"
                sh '''
                    
                    sudo ssh -i /var/lib/jenkins/node.pem -t -o StrictHostKeyChecking=no ubuntu@ec2-34-203-205-26.compute-1.amazonaws.com
                    sudo git init
                    sudo git remote add origin https://$GITHUB_KEY_USR:$GITHUB_KEY_PSW@github.com/cent-kanayo/testjenkins.git
                    sudo git pull origin main
                    sudo apt-get update
                    sudo apt-get install \
                            ca-certificates \
                            curl \
                            gnupg \
                            lsb-release
                    sudo mkdir -p /etc/apt/keyrings
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                     echo \
                        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

                    sudo apt-get update
                    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
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
