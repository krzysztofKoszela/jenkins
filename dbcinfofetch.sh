#!/bin/sh

SCRIPT_PATH="./dbcinfofetch.sql"

LOG_DIR="."

LOG_FILEPATH="${LOG_DIR}/dbcinfofetch.log"

 


 

bteq < ${SCRIPT_PATH} > ${LOG_FILEPATH}

 

ReturnCode=$?

 

if[[ ${ReturnCode} -eq 0 ]]; then

                 echo "DBC info FETCH script completed successfully"

                 exit 0

else

                 echo "DBC info FETCH script failled"

                 exit 1

fi
