#!/bin/sh

SCRIPT_PATH="./dbcinfofetch.sql"

LOG_DIR="."

LOG_FILEPATH="${LOG_DIR}/dbcinfofetch.log"

 


 

bteq < ${SCRIPT_PATH} > ${LOG_FILEPATH}

