pipeline {
  agent any
  
   parameters {
        string(name: 'BATCHUSER', defaultValue: 'PLBATCH_POLSKApppp', description: 'Nazwa użytkownika technicznego:')

        text(name: 'RIGHTS', defaultValue: 'Baza1.tab1:[select,insert],\nbaza2.tab2:[insert,delete,select]', description: 'Podaj obiekty i uprawnienia:')
   }
  
  stages {
    stage('inputParameters') {
      steps {
        echo "Hello ${params.BATCHUSER}"

                echo "Uprawnienia: ${params.RIGHTS}"
      }
    }

 stage('connect to Teradata') {
      steps {
sh '''
#You can add
#comments here
#so that other developer can get some info 
#about this script
#Author: ABCDEF Date: 10-July-2019
BATCHUSERL='/'' + params.BATCHUSER + '/''
# dobre BATCHUSERL=''' + params.BATCHUSER + '''
#BATCHUSERL="'\$params.BATCHUSER'"
#BATCHUSERL="'"${params.BATCHUSER}"'"

LOGON_STRING='192.168.1.38/dbc, dbc'
default_db=KKDB

#call BTEQ utility and run SQL commands
bteq << label_bteq
        .logon ${LOGON_STRING};

database ${default_db};

select * from BatchUserOwner where BatchUserName in $BATCHUSERL;

.LOGOFF;
.EXIT;

label_bteq >> params.RIGHTS
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
