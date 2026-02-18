#!/usr/bin/env bash

pip install -e .

cd checkpoints
wget https://dl.fbaipublicfiles.com/segment_anything_2/072824/sam2_hiera_tiny.pt
wget https://dl.fbaipublicfiles.com/segment_anything_2/072824/sam2_hiera_base_plus.pt
cd ..

mkdir data
cd data
gdown --fuzzy "https://drive.google.com/file/d/1vkJbJ7JSQrq--Qze-E2_WL1xJeaLWsZx/view?usp=sharing"
tar -xvf VOS-Endovis17.tar
rm VOS-Endovis17.tar
cd ..
