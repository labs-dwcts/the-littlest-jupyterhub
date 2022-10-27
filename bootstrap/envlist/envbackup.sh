#!/usr/bin/env bash

set -e

tfenvlist() {
  # create a backup directory
  mkdir ~/envlist
  
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate tf-2.7
  conda env export > ~/envlist/tf-2.7.yml

  # conda deactivate tf-2.7
  conda deactivate
}

ptenvlist() {
  # create a backup directory
  mkdir ~/envlist
  
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate pt-1.12.1
  conda env export > ~/envlist/pt-1.12.1.yml

  # conda deactivate pt-1.12.1
  conda deactivate
}

sklenvlist() {
  # create a backup directory
  mkdir ~/envlist
  
  # conda environment list
  conda env list
  
  # backup conda environments
  conda activate sklearn-1.1.2
  conda env export > ~/envlist/sklearn-1.1.2.yml

  # conda deactivate sklearn-1.1.2
  conda deactivate
}