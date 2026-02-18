python tools/vos_inference.py \
    --sam2_cfg configs/sam2.1/sam2_hiera_b+.yaml \
    --sam2_checkpoint ./checkpoints/sam2.1_hiera_b+.pth \
    --output_mask_dir ./results/sam2.1/endovis_2017/instrument \
    --input_mask_dir ./datasets/VOS-Endovis2017/valid/VOS/Annotations_vos_instrument \
    --base_video_dir ./datasets/VOS-Endovis2017/valid/JPEGImages \
    --gt_root ./datasets/VOS-Endovis2017/valid/Annotations \
    --gpu_id 0
