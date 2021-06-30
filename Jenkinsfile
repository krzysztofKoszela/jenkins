pipeline {
  agent any
  
   parameters {
        string(name: 'BATCHUSER', defaultValue: 'PLBATCH_POLSKA', description: 'Podaj nazwę użytkownika technicznego:')
        text(name: 'RIGHTS', defaultValue: 'Baza1.tab1:[select,insert],\nbaza2.tab2:[insert,delete,select]', description: 'Podaj obiekty i uprawnienia:')
        text(name: 'REASON', defaultValue: 'Uprawnienia potrzebne do...', description: 'Podaj uzasadnienie nadania uprawnień:')
   }
  
  stages {

    stage('ACCEPT DATA OWNERS') {
      steps {
        script{
def result = (params.RIGHTS =~ /^.+:/).findAll()
          echo result
        }
      }
    }

    stage('addPermissons') {
      steps {
        sh '''#!/bin/bash
echo "rm"
rm /tmp/abc.txt'''
      }
    }

  }
}
