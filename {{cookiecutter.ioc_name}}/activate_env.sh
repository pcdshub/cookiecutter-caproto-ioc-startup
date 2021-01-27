#!/bin/bash

. config.sh

conda deactivate
conda activate "$CONDA_ENV_PATH"
