pipeline {
  agent any
  parameters {
    string(name: 'Person_name',
           defaultValue: 'Mr. Koti',
           description: 'Who should I say hello to?')
    booleanParam(name: 'TOGGLE', 
                defaultValue: false,
                description: 'Toggle this value')
    choice(name: 'Build', 
          choices: ['Development', 'Stage', 'Production'], 
          description: 'Pick environemnt  Carefully')
    choice(name: 'Stages', 
          choices: ['sonar', 'nexus', 'Dockerfile'], 
          description: 'Pick environemnt  Carefully')
  }
  environment {
    APP_BUILD = "development"
    APP_TEST = "testing"
  }
  stages {
    stage ("build"){
      steps {
        echo "welcome to the jenkins ${params.Person_name}"
        echo "choose the environment name is ${params.Build}"
        echo "choose the scan for application is ${params.Stages}"
      }
    }
    stage ("test"){
      when {
        choice "Stages"
      }
      steps {
        echo "testing the application is ${env.APP_TEST}"
      }

    }
  }
}

