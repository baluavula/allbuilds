pipeline {
  agent any
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
  stages {
    stage ("build"){
      when {
        anyOf {
          expression { params.Environments == 'Build' }
          expression { params.Environments == 'Sonar' }
        }
          
        } 

      steps {
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
}

