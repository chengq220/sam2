#!/usr/bin/env bash

python tools/vos_inference.py \
    --sam2_cfg "configs/sam2.1/sam2.1_hiera_b+.yaml" \
    --sam2_checkpoint "./checkpoints/sam2.1_hiera_base_plus.pt" \
    --output_mask_dir "./results/sam2.1/endovis_2017" \
    --input_mask_dir "./data/VOS-Endovis17/valid/VOS" \
    --base_video_dir "./data/VOS-Endovis17/valid/JPEGImages" \
    --gt_root "./data/VOS-Endovis2017/valid/Annotations" \
    --gpu_id 0