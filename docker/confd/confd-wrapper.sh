#!/bin/bash
set -e  

# use the default from goStatic
export STELLARWELLKNOWN_CONFIG_PORT=${STELLARWELLKNOWN_CONFIG_PORT:-8043}

/confd -onetime -backend env

echo "Starting goStatic server"
exec /goStatic -port ${STELLARWELLKNOWN_CONFIG_PORT} -append-header 'Access-Control-Allow-Origin:*'

