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
rm /tmp/abc.txt
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
bteq << EOF
 .LOGON ${HOST}/${USER},${PASSWORD}
 DATABASE ${SRC_DB};
.EXPORT DATA FILE = /tmp/abc.txt;
.set RECORDMODE OFF;
.set separator "|"
 select OwnerName from ${SRC_DB}.${SOURCE_TABLE} where BatchUserName in $batchgrovvy;
 .EXPORT RESET;
.LOGOFF;
.QUIT;
'''

      }
    }

    stage('email') {
      steps {
      script {
        String fileContents = new File('/tmp/abc.txt').text
            def mailRecipients = "'"+fileContensts+"'"
            def jobName = currentBuild.fullDisplayName
            emailext body: '''${SCRIPT, template="groovy-html.template"}''',
            mimeType: 'text/html',
            subject: "[Jenkins] ${jobName}",
            to: "${mailRecipients}",
            replyTo: "${mailRecipients}",
            recipientProviders: [[$class: 'CulpritsRecipientProvider']]
        }
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
