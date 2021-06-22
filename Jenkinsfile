pipeline {
  agent any
  
   parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
   }
  
  stages {
    stage('inputParameters') {
      steps {
        echo "Hello ${params.PERSON}"

                echo "Biography: ${params.BIOGRAPHY}"

                echo "Toggle: ${params.TOGGLE}"

                echo "Choice: ${params.CHOICE}"

                echo "Password: ${params.PASSWORD}"
      }
    }

    stage('connect to Teradata') {
      steps {
        sh "chmod +x -R ${env.WORKSPACE}"
        sh './dbcinfofetch.sh'
         sh '''#!/bin/bash
#!/bin/ksh

#You can add
#comments here
#so that other developer can get some info 
#about this script
#Author: ABCDEF Date: 10-July-2019

LOGON_STRING='192.168.1.38/dbc, dbc'
default_db=KKDB

#call BTEQ utility and run SQL commands
bteq << label_bteq
.logon ${LOGON_STRING}

database ${default_db};

select * from BatchUserOwner;

.LOGOFF;
.EXIT;

label_bteq >> params.BIOGRAPHY
'''
      }
    }

    stage('batchUserOwnerApprove') {
      steps {
        sh '''#!/bin/bash
echo "batch user owner approve"'''
      }
    }

    stage('dataOwnerApprove') {
      steps {
        sh '''#!/bin/bash
echo "data owner approve"'''
      }
    }

    stage('addPermissons') {
      steps {
        sh '''#!/bin/bash
echo "done"'''
      }
    }

  }
}
