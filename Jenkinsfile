pipeline {
    agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_hub')
	}
    tools {
     maven 'Maven'    
          }   
    stages{
        stage("git pull"){
            steps{
              
                git branch: 'main', 
                credentialsId: 'aminetoken', 
                url: 'https://github.com/aminemasseoudi998/Devops.git'
                    
                }
                
            }
            
        stage('MVN COMPILE') {
                steps {
                sh 'mvn clean compile'
                    
                }
                
            }
       
     
        stage('build'){
		agent {
			label 'docker'
			}
            steps{
                sh 'mvn install package'
            }
		
         }
         
   //    stage('SonarQube analysis') {

      //  steps{
      // withSonarQubeEnv('sonarserver') { 
       
      //  sh "mvn sonar:sonar"
  //  }
      // }
      //  }
      //  stage('nexus deploy') {
     //   steps{
         //   sh 'mvn deploy'
           
      //  }

  //  }
        
      stage('Docker Build') {
	      
              		agent {
			label 'docker'
			}           
			steps {
				sh 'docker build -t aminemass/tpachatproject .'
			}
		}
        
       
		stage('Docker Login') {
			agent {
			label 'docker'
			}

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		} 
	    
	    
	    	stage('Push') {
			agent {
			label 'docker'
			}

			steps {
				sh 'docker push aminemass/tpachatproject:latest'
			}
		}
	    
	        stage('Docker Compose'){
			agent {
			label 'docker'
			}
            steps{
                script{
                    sh 'docker-compose up -d'
                }
            }
       
        }
        
        
        
	
          
            
}
    post {
		always {
			sh 'docker logout'
		}
	}

}
