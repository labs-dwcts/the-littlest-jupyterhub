#!/usr/bin/env bash

set -e

tfenvlist() {
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate tf-2.7
  conda env export > ~/tf-2.7.yml

  # conda deactivate tf-2.7
  conda deactivate
}

ptenvlist() {
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate pt-1.12.1
  conda env export > ~/pt-1.12.1.yml

  # conda deactivate pt-1.12.1
  conda deactivate
}

sklenvlist() {
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate sklearn-1.1.2
  conda env export > ~/sklearn-1.1.2.yml

  # conda deactivate sklearn-1.1.2
  conda deactivate
}