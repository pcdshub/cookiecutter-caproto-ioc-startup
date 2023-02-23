#!/bin/bash
# Usage: bash initialize.sh
#   This script will use the configuration settings in ``config.sh`` to
#   create a conda environment in this directory named "conda_env".
#   This should be run *after* config.sh has been customized.

. config.sh

git submodule update --init --recursive

set -e

# Run conda bash hooks to ensure that conda activate will work:
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"

# Create the new environment with the configured Python version
conda create --yes --prefix "$PWD/conda_env" python=${PYTHON_VERSION}

# Activate the IOC environment
. "${TOP}/activate_env.sh"

for pkg in ${PACKAGES}; do
    pushd "$pkg" || exit 1
    pip install -e .
    popd || exit 1
done

set +e
