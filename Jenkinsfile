pipeline {
  agent any
  
   parameters {
        string(name: 'BATCHUSER', defaultValue: 'PLBATCH_POLSKA', description: 'Nazwa użytkownika technicznego:')

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
batchgrovvy="\'''' + params.BATCHUSER + '''\'"
output="cos"
LOGON_STRING='192.168.1.38/dbc, dbc'
default_db=KKDB

#do sprawdzenia
#https://www.unix.com/shell-programming-and-scripting/280214-bteq-script-shell-script.html
#https://stackoverflow.com/questions/25841358/get-teradata-bteq-query-result-in-a-unix-variable
#https://www.teradatapoint.com/teradata/teradata-bteq-part-2.htm

#call BTEQ utility and run SQL commands
testabcd=$(bteq << label_bteq |grep '^>' |sed -e "s/^>//"
        .logon ${LOGON_STRING};

database ${default_db};

select * from BatchUserOwner where BatchUserName in $batchgrovvy;

.LOGOFF 
.QUIT; 
.EXIT;
label_bteq)
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
