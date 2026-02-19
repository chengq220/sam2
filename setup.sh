#!/usr/bin/env bash

pip install -e .
pip install gdown
pip install opencv-python
pip install scikit-image

cd checkpoints
wget https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_base_plus.pt
# wget https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_small.pt
cd ..

mkdir data
cd data
# gdown --fuzzy "https://drive.google.com/file/d/1vkJbJ7JSQrq--Qze-E2_WL1xJeaLWsZx/view?usp=sharing"
# tar -xvf endovis17.tar
# rm endovis17.tar
# cd VOS-Endovis17/valid
# gdown --fuzzy "https://drive.google.com/file/d/1FOdReaUUfceEvl-4mwZRsyg8qBdjjKZ1/view?usp=sharing"
# tar -xvf VOS-endovis17.tar
# rm VOS-endovis17.tar 
# cd ..

gdown --fuzzy "https://drive.google.com/file/d/1f3qdi7J2GsHGDmxdc4vXaf6ZsFGa_vOH/view?usp=sharing"
tar -xvf endovis2018_new.tar
rm endovis2018_new.tar
# cd VOS-Endovis18/valid
# gdown --fuzzy "https://drive.google.com/file/d/1bDA8IwSxHIEGhcrcbsw9UsWMxnQmIIX2/view?usp=sharing"
# tar -xvf VOS-endovis18.tar
# rm VOS-endovis18.tar
cd ..
