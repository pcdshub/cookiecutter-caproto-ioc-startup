#!/bin/bash

if [ -f "/reg/g/pcds/pyps/conda/pcds_conda" ]; then
  echo "* Sourcing pcds_conda to get access to conda"
  # shellcheck disable=SC1091
  source /reg/g/pcds/pyps/conda/pcds_conda
fi

if [ ! -f "config.sh" ]; then
  echo "* IOC configuration not found!"
  exit 1
fi

echo "* Sourcing this IOC's configuration"
. config.sh

echo "  - IOC:                     $IOC"
echo "  - IOC_COMMAND:             $IOC_COMMAND"
echo "  - PREFIX:                  $PREFIX"
echo "  - IOC_DATA_PATH:           $IOC_DATA_PATH"
echo "  - CONDA_ENV_PATH:          $CONDA_ENV_PATH"
echo "  - EPICS_CA_AUTO_ADDR_LIST: $EPICS_CA_AUTO_ADDR_LIST"
echo "  - EPICS_CA_ADDR_LIST:      $EPICS_CA_ADDR_LIST"
echo "  - CAPTURE_LOGS:            $CAPTURE_LOGS"
echo "  - LOG_FILE_PATH:           $LOG_FILE_PATH"

echo "* Deactivating any existing conda environment"
conda deactivate || echo "Conda deactivate failed; continuing..."

echo "* Activating the conda environment: $CONDA_ENV_PATH"
conda activate --no-stack "$CONDA_ENV_PATH"

echo "* Environment activated. Python is now:"
which python
