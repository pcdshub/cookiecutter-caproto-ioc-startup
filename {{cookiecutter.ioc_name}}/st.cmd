#!/usr/bin/env bash

. config.sh

source /reg/g/pcds/pyps/conda/pcds_conda

run_ioc() {
    source "${TOP}/activate_env.sh"
    echo ""
    echo "* Version information:"
    python --version
    echo "caproto version: $(caproto-get --version)"
    echo ""
    echo "* EPICS settings:"
    env |grep EPICS_
    echo ""
    echo "* Running the IOC..."
    set -ex
    cd ${TOP}
    ${IOC_COMMAND} --prefix "${PREFIX}" --list-pvs
}

if [ "${CAPTURE_LOGS}" == "1" ]; then
    (run_ioc 2>&1) | tee --append $LOG_FILE_PATH
else
    run_ioc
fi
