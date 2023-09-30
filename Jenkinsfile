pipeline {
    agent any
 
environment {
		DOCKERHUB_CREDENTIALS=credentials('dckr_pat_29mcpE6TEQaidinxTNa4i0IICtw')
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
				sh 'docker build -t aminemass/tpachatproject .'
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
