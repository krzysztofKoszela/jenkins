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
        sh '''
        #!/bin/sh
        echo "This script will connect to teradata and fetch the data"

bteq < 
LOGON 192.168.1.38/dbc, dbc

SELECT * from DBC.DBCinfo; 

.LOGOFF;

.EXIT;
> ${params.BIOGRAPHY}

 

ReturnCode=$?

 

if[[ ${ReturnCode} -eq 0 ]]; then

                 echo "DBC info FETCH script completed successfully"

                 exit 0

else

                 echo "DBC info FETCH script failled"

                 exit 1

fi
   
        echo "Teradata END"
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
