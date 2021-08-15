pipeline {
  agent any
  
   parameters {
        string(name: 'BATCHUSER', defaultValue: 'PLBATCH_POLSKA', description: 'Podaj nazwę użytkownika technicznego:')
        text(name: 'RIGHTS', defaultValue: 'Baza1.tab1:[select,insert],\nbaza2.tab2:[insert,delete,select]', description: 'Podaj obiekty i uprawnienia:')
        text(name: 'REASON', defaultValue: 'Uprawnienia potrzebne do...', description: 'Podaj uzasadnienie nadania uprawnień:')
   }
  
  stages {
    stage('ACCEPT BATCH USER OWNER') {
      steps {
bat '''
::Compare batch user name form input parameters with batch user name on Teradata
set batchgrovvy="\'''' + params.BATCHUSER + '''\'"
set LOGON_STRING='192.168.1.38/dbc, dbc'
set default_db=KKDB
set HOST='192.168.1.38'
set USER='DBC'
set PASSWORD='DBC'
set SRC_DB=KKDB;
set SOURCE_TABLE='BatchUserOwner'
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
    Proszę kliknij w link ${BUILD_URL} i zaakceptuj lub odrzuć zmianę.<br>
 ''',    
    mimeType: 'text/html',
   subject: "[Jenkins_Teradata_Batch_Users] ${jobName} Zgoda na nadanie uprawnień dla ${params.BATCHUSER}",
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

    stage('ACCEPT DATA OWNERS') {
      steps {
       // String r = params.RIGHTS
//assert r =~ /^.+:/
 echo 'Hello world!' 
      }
    }

    stage('addPermissons') {
      steps {
        bat '''#!/bin/bash
echo "rm"
rm /tmp/abc.txt'''
      }
    }

  }
}
