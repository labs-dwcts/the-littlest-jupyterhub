#!/usr/bin/env bash

set -e

tfenvbackup() {
  # create a backup directory
  mkdir ~/envbackup
  
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate tf-2.7
  conda env export > envbackup/tf-2.7.yml

  # conda deactivate tf-2.7
  conda deactivate
}

ptenvbackup() {
  # create a backup directory
  mkdir ~/envbackup
  
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate pt-1.12.1
  conda env export > envbackup/pt-1.12.1.yml

  # conda deactivate pt-1.12.1
  conda deactivate
}

sklenvbackup() {
  # create a backup directory
  mkdir ~/envbackup
  
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate sklearn-1.1.2
  conda env export > envbackup/sklearn-1.1.2.yml

  # conda deactivate sklearn-1.1.2
  conda deactivate
}