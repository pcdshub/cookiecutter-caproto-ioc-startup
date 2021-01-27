#!/bin/bash

. config.sh

git submodule update --init --recursive

set -e

conda create --yes --prefix "$PWD/conda_env" python=${PYTHON_VERSION}
. "${TOP}/activate_env.sh"

for pkg in ${PACKAGES}; do
    pushd "$pkg" || exit 1
    pip install -e .
    popd || exit 1
done

set +e
