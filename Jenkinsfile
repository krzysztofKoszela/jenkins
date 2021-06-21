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
        #!/bin/bash
        echo "This script will connect to teradata and fetch the data"
        .LOGON 192.168.1.38/dbc, dbc
   DATABASE KKDB;

   CREATE TABLE employee_bkup ( 
      EmployeeNo INTEGER, 
      FirstName CHAR(30), 
      LastName CHAR(30), 
      DepartmentNo SMALLINT, 
      NetPay INTEGER 
   )
   Unique Primary Index(EmployeeNo);

   .IF ERRORCODE <> 0 THEN .EXIT ERRORCODE;
  
   SELECT * FROM  
   Employee 
   Sample 1; 
   .IF ACTIVITYCOUNT <> 0 THEN .GOTO InsertEmployee;  

   DROP TABLE employee_bkup;
  
   .IF ERRORCODE <> 0 THEN .EXIT ERRORCODE; 
 
   .LABEL InsertEmployee 
   INSERT INTO employee_bkup 
   SELECT a.EmployeeNo, 
      a.FirstName, 
      a.LastName, 
      a.DepartmentNo, 
      b.NetPay 
   FROM  
   Employee a INNER JOIN Salary b 
   ON (a.EmployeeNo = b.EmployeeNo);  

   .IF ERRORCODE <> 0 THEN .EXIT ERRORCODE; 
.LOGOFF; 
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
