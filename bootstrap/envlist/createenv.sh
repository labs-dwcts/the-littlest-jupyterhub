#!/usr/bin/env bash

set -e

createEnv() {
  conda create -n Pytorch python=3.8 --use-local --yes
  source activate Pytorch
  conda install ipykernel pytorch torchvision -c soumith
  python -m ipykernel install --user --name "Pytorch" --display-name="Pytorch"
  source deactivate

}

exportEnv() {
  conda install conda-pack
  conda pack -n Pytorch -o Pytorch.tar.gz
  
  # yml
  conda env export -n Pytorch -f Pytorch.yml
}

importEnv() {
  mkdir -p $HOME/.conda/envs/Pytorch
  tar xvzf Pytorch.tar.gz -C $HOME/.conda/envs/Pytorch

  # yml
  conda env create -f Pytorch.yml
}

removeEnv() {
  conda remove -n Pytorch --all
}

# createEnv() {
#   # create conda environments
#   conda env list

#   conda env create --name "tf-2.7" --file "~/setenv/tf-2.7.yml"
#   conda env create --name "pt-1.12.1" --file "~/setenv/pt-1.12.1.yml"
#   conda env create --name "sklearn-1.1.2" --file "~/setenv/sklearn-1.1.2.yml"

#   # conda environment list
#   conda env list
# }
# addEnv() {
#   python -m ipykernel install --user --name "tf-2.7" --display-name="tf-2.7"
#   python -m ipykernel install --user --name "pt-1.12.1" --display-name="pt-1.12.1"
#   python -m ipykernel install --user --name "sklearn-1.1.2" --display-name="sklearn-1.1.2"
# }

# createEnv
# addEnv