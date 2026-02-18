import sys
sys.path.append('segment-anything-2')

# import torch
# from sam2.build_sam import build_sam2
# from sam2.sam2_image_predictor import SAM2ImagePredictor

# from PIL import Image, ImageDraw, ImageOps
# from shapely.geometry import LineString, MultiLineString, Polygon, Point, GeometryCollection
# from skimage.morphology import medial_axis
# from scipy.optimize import minimize_scalar
# from scipy.ndimage import binary_dilation
# from skimage.measure import label
# import torchvision.transforms as TF
import glob

import argparse
import os
# import cv2
import json
import random
# import matplotlib.pyplot as plt
# import numpy as np

# np.random.seed(1) 

def bounding_box(img):
    rows = np.any(img, axis=1)
    cols = np.any(img, axis=0)
    rmin, rmax = np.where(rows)[0][[0, -1]]
    cmin, cmax = np.where(cols)[0][[0, -1]]
    return rmin, rmax, cmin, cmax # y1, y2, x1, x2 


if __name__ == '__main__': 
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("--dataset", default="./data/testing", type=str, help="the specific dataset")
    parser.add_argument("--num-class", default=7, type=int, help="the number of classes for this dataset")
    args = parser.parse_args()
    
    # Set up model
    checkpoint = "checkpoints/sam2_hiera_tiny.pt"
    model_cfg = "sam2_hiera_t.yaml"
    # predictor = SAM2ImagePredictor(build_sam2(model_cfg, checkpoint))

    # Set up dataset
    dataset = args.dataset
    num_class = args.num_class
    input_vid_dir = os.path.join(dataset, 'JPEGImages')
    vid_list = list(glob.glob(os.path.join(input_vid_dir, "*")))
    print(vid_list)

    print(f"Number of video found: {len(vid_list)}")
    
    transform = TF.Compose([
        TF.CenterCrop(1024),
    ])

    cls = 1

    for vid_idx, vid_path in enumerate(vid_list):
        frames = sorted(list(glob.glob(os.path.join(vid_path, "*"))))
        print(f"Number of frames for {os.path.basename(vid_path)} found: {len(frames)}")
        for im_idx, im_name in enumerate(frames):
            preds_mask_full = []
            try:
                input_image = Image.open(os.path.join(input_img_dir, im_name)).convert("RGB")
            except:
                input_image = Image.open(os.path.join(input_img_dir, im_name.replace('png', 'jpg'))).convert("RGB")

            input_array = np.array(input_image)
            input_array = np.uint8(input_array / np.max(input_array) * 255)
            
            # Mask has to be float
            with torch.inference_mode(), torch.autocast("cuda", dtype=torch.bfloat16):
                input_image_pil = Image.open(os.path.join(input_img_dir, im_name.replace('png', 'jpg'))).convert("RGB")
                predictor.set_image(input_image_pil)

                if(im_idx == 0 )
                    prompt_mask = Image.open(os.path.join(input_img_dir, im_name.replace('png', 'jpg')).replace('JPEGImages', "Annotations")).convert("RGB")
                    prompt_mask = np.array(prompt_mask)
                    prompt_mask = prompt_mask[prompt_mask == cls]
                    y1, y2, x1, x2 = bounding_box(prompt_mask)
                    bbox = np.array([x1, y1, x2, y2])
                else:
                    prompt = ""
                
                preds, _, _ = predictor.predict(box=prompt)
                preds = preds.transpose((1,2,0))
                
# https://blog.roboflow.com/sam-2-video-segmentation/

points = np.array([[703, 303]], dtype=np.float32)
labels = np.array([1])
frame_idx = 0
tracker_id = 1

_, object_ids, mask_logits = sam2_model.add_new_points(
    inference_state=inference_state,
    frame_idx=frame_idx,
    obj_id=tracker_id,
    points=points,
    labels=labels,
)
