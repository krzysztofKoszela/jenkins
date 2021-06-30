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
script {
  def data = readFile(file: '/tmp/abc.txt')
                   println(data)
  
  def jobName = currentBuild.fullDisplayName
def mailToRecipients = data
def useremail= data
  
  def userAborted = false

 emailext body: '''
    Please go to console output of ${BUILD_URL}input to approve or Reject.<br>
 ''',    
    mimeType: 'text/html',
    subject: "[Jenkins] ${jobName} Build Approval Request",
    from: "${useremail}",
    to: "${mailToRecipients}",
    recipientProviders: [[$class: 'CulpritsRecipientProvider']]

 echo "Building1"
 try { 
    userInput = input submitter: 'vagrant', message: 'Do you approve?'
 } catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException e) {
   cause = e.causes.get(0)
   echo "Aborted by " + cause.getUser().toString()
   userAborted = true
    echo "SYSTEM aborted, but looks like timeout period didn't complete. Aborting."
 }
    if (userAborted) {
  currentBuild.result = 'ABORTED'
 } else {
  echo "Building2"
 }
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
echo "rm"
rm /tmp/abc.txt'''
      }
    }

  }
}
