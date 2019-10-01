node{
   stage('SCM Checkout'){
       git credentialsId: 'git-creds', url: 'https://github.com/Narendrare/babita.git'
   }
   stage('SonarQube Analysis') {
        def mvnHome =  tool name: 'maven-3', type: 'maven'
        withSonarQubeEnv('sonar-6') { 
          sh "${mvnHome}/bin/mvn sonar:sonar"
        }
    }
   stage('Mvn Package'){
     def mvnHome = tool name: 'maven-3', type: 'maven'
     def mvnCMD = "${mvnHome}/bin/mvn"
     sh "${mvnCMD} clean package"
   }
   stage('build docker image'){
     /**sh label: '', script: 'docker build -t test .'
      * */
      sh 'docker build -t test .'
   } 
   stage('push ECR'){
    docker.withRegistry('http://011701854391.dkr.ecr.us-east-2.amazonaws.com' , 'ecr:us-east-2:ecr1'){
    docker.image('test').push()    
    }
   }
   /** stage('dev'){
    withCredentials([kubeconfigContent(credentialsId: 'kubeconfig-cred', variable: 'KUBECONFIG_CONTENT')]) {
    sh '''echo "$KUBECONFIG_CONTENT" > kubeconfig && cat kubeconfig && rm kubeconfig'''
    }
    }
    stage('dev'){
    kubernetesDeploy(
        configs: 'deployment2.yaml',
        kubeconfigId: 'kubeconfig-cred',
        )
    }**/
    stage('dev'){
        sh 'kubectl apply -f /var/lib/jenkins/deployment.yaml'
    }
    }
