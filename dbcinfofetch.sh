#!/bin/sh

SCRIPT_PATH="/home/production/scripts/dbcinfofetch.sql"

LOG_DIR="/home/production/scripts/log"

LOG_FILEPATH="${LOG_DIR}/dbcinfofetch.log"

 

touch $LOG_FILE

 

bteq < ${SCRIPT_PATH} > ${LOG_FILEPATH}

 

ReturnCode=$?

 

if[[ ${ReturnCode} -eq 0 ]]; then

                 echo "DBC info FETCH script completed successfully"

                 exit 0

else

                 echo "DBC info FETCH script failled"

                 exit 1

fi
