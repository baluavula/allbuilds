pipeline {
  agent {
    label "app-slave"
  }
  environment {
    APP_BUILD = "development"
    APP_TEST = "testing"
  }
  stages {
    stage ("build"){
      steps {
        echo "building the application in ${env.APP_BUILD}"
      }
    }
    stage ("test"){
      steps {
        echo "testing the application is ${env.APP_TEST}"
      }

    }
  }
}

