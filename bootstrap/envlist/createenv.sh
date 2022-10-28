#!/usr/bin/env bash

set -e

createEnv() {
  # create conda environments
  conda env list

  conda env create --name "tf-2.7" --file "~/setenv/tf-2.7.yml"
  conda env create --name "pt-1.12.1" --file "~/setenv/pt-1.12.1.yml"
  conda env create --name "sklearn-1.1.2" --file "~/setenv/sklearn-1.1.2.yml"

  # conda environment list
  conda env list
}
addEnv() {
  python -m ipykernel install --user --name "tf-2.7" --display-name="tf-2.7"
  python -m ipykernel install --user --name "pt-1.12.1" --display-name="pt-1.12.1"
  python -m ipykernel install --user --name "sklearn-1.1.2" --display-name="sklearn-1.1.2"
}

createEnv
addEnv