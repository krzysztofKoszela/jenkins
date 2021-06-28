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
HOST='192.168.1.38'
USER='DBC'
PASSWORD='DBC'
SRC_DB=KKDB;
SOURCE_TABLE='BatchUserOwner'
testabcd(){
bteq << EOF 2>&1  |grep '^>' |sed -e "s/^>//"
 .LOGON ${HOST}/${USER},${PASSWORD}
 DATABASE ${SRC_DB};
 .set width 2000;
  .set titledashes off;
 SELECT '>'||COUNT(*) FROM ${SRC_DB}.${SOURCE_TABLE};
.LOGOFF;
.QUIT;
EOF
}

var_test=$(testabcd)

echo $var_test
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
