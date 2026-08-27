pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '2', // no of  builds  need to present
                   daysToKeepStr: '30', // number of days  builds need to present
                   artifactNumToKeepStr: '5', // number od artifacts  need to present
                   artifactDaysToKeepStr: '15' // number of artfact days to keep as a backup
                   ))
  }
  parameters {
    string(name: 'Employee_name',
           defaultValue: 'Mr. Koti',
           description: 'Enter the  employee to identify you?')
    booleanParam(name: 'TOGGLE', 
                defaultValue: false,
                description: 'Toggle this value')
    choice(name: 'Environments', 
          choices: ['Build', 'Sonar', 'Nexus', 'Dockerfile', 'DeploytoDev', 'DeploytoStage'], 
          description: 'Pick the stage as u wish: ')
  }
  environment{
    GITHUB_CREDS = credentials('github_creds')
    GITHUB_ACCOUNT = 'baluavaula'
    GITHUB_REPO = 'login-ms'
    GITHUB_TAG = 'v1'
  }
  stages {
    stage ("build"){
      when {
        expression { params.Environments == 'Build' }
        }
      steps {
        sh 'docker login -u ${env.GITHUB_CREDS_USR} -p ${env.GITHUB_CREDS_PSW}'
        sh 'docker build -t . ${env.GITHUB_ACCOUNT}/${env.GITHUB_REPO}/:${env.GITHUB_TAG}'
        sh 'docker push ${env.GITHUB_ACCOUNT}/${env.GITHUB_REPO}/:${env.GITHUB_TAG}'
          echo "**********Build stage commpleted  successfully: "
      }
    }
    stage ("Sonar"){
      when {
        expression { params.Environments == 'Sonar' }
      }
      steps {
        echo "Scan stage  is  completed"
      }
    }
    stage ('Nexus'){
      when {
        expression { params.Environments == 'Nexus' }
      }
      steps {
        echo "Nexus stages passed successfully: "
      }
    }
    stage ('Dockerfile'){
      when {
        expression { params.Environments == 'Dockerfile' }
      }
      steps{
        echo "Image created  successfully:"
      }
    }
    stage('DeployToDev'){
      when {
        expression { params.Environments == 'DeploytoDev' }
      }
      steps {
        echo "app build on dev completed  successfully: "
      }
    }
    stage('DeploytoStage'){
      when {
        expression { params.Environments == 'DeploytoStage' }
      }
      steps {
        echo "image deployed to  stage completed: "
      }
    }
  }
  post {
        // always  will send a  message  everyting  whether  it is  success/failure/any event happend
      always {
            echo "always  block executed: "
        }
        failure {
          echo "pipeline  failed: "
        }
        success {
          echo "success block executed: "
        }
      }
}

