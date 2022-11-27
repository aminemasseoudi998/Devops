pipeline {
    agent any
 
environment {
		DOCKERHUB_CREDENTIALS=credentials('d2019489-e71a-40bd-b1e9-8639d5298a74')
	}
    
    stages{
        stage("git pull"){
            steps{
              
                git branch: 'reglementBack', 
                credentialsId: '119d27c5-ec0b-44fb-882f-0735a2890bd1', 
                url: 'https://github.com/nesrinehm1996/magasinback.git'
                    
                }
                
            }
            
        stage('MVN COMPILE') {
                steps {
                sh 'mvn clean compile'
                    
                }
                
            }
        stage('clean'){
                steps{
                sh 'mvn clean package'
                    
                }
                
            }  
        stage('MVN TEST') {
                steps {
                sh 'mvn clean test'
                    
                }
                
            }  
        stage('build'){
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

			steps {
				sh 'docker build -t aminemasseoudi/tpachatproject .'
			}
		}
        
       
		stage('Docker Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		} 
	    
	    
	    	stage('Push') {

			steps {
				sh 'docker push aminemasseoudi/tpachatproject:latest'
			}
		}
	    
	        stage('Docker Compose'){
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
