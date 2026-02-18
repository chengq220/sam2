#!/usr/bin/env bash

pip install -e .
pip install gdown
pip install opencv-python
pip install scikit-image

cd checkpoints
wget https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_base_plus.pt
wget https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_small.pt
cd ..

mkdir data
cd data
gdown --fuzzy "https://drive.google.com/file/d/1vkJbJ7JSQrq--Qze-E2_WL1xJeaLWsZx/view?usp=sharing"
tar -xvf VOS-Endovis17.tar
rm VOS-Endovis17.tar
cd ..
