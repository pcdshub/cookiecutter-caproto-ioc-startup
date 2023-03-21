#!/bin/bash
# Usage: bash initialize.sh
#   This script will use the configuration settings in ``config.sh`` to
#   create a conda environment in this directory named "conda_env".
#   This should be run *after* config.sh has been customized.

if [ -f "/reg/g/pcds/pyps/conda/pcds_conda" ]; then
  echo "* Sourcing pcds_conda to get access to conda"
  # shellcheck disable=SC1091
  source /reg/g/pcds/pyps/conda/pcds_conda
fi

. config.sh

git submodule update --init --recursive

# Run conda bash hooks to ensure that conda activate will work:
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)" || \
  echo "conda shell.bash failed; continuing..."

set -e

# Create the new environment with the configured Python version
conda create --yes --prefix "$PWD/conda_env" python="${PYTHON_VERSION}"

# Activate the IOC environment
. "${TOP}/activate_env.sh"

echo "* Installing required packages from the configuration: ${PACKAGES}"

for pkg in ${PACKAGES}; do
    echo "* Looking in ${PWD} for ${pkg}"
    pushd "$pkg" || exit 1
    pip install -e .
    popd || exit 1
done

set +e
