#!/usr/bin/env bash

set -e

createEnv() {
  # create conda environments
  /opt/tljh/user/bin/conda env list

  /opt/tljh/user/bin/conda env create --name "tf-2.7" --file "~/setenv/tf-2.7.yml"
  /opt/tljh/user/bin/conda env create --name "pt-1.12.1" --file "~/setenv/pt-1.12.1.yml"
  /opt/tljh/user/bin/conda env create --name "sklearn-1.1.2" --file "~/setenv/sklearn-1.1.2.yml"

  # conda environment list
  /opt/tljh/user/bin/conda env list
}

createEnv