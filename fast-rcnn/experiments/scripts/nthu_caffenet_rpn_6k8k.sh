#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="experiments/logs/nthu_caffenet_rpn_6k8k.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time ./tools/test_net.py --gpu $1 \
  --def models/CaffeNet/kitti_test/test_rpn.prototxt \
  --net output/kitti/kitti_trainval/caffenet_fast_rcnn_rpn_6k8k_kitti_iter_80000.caffemodel \
  --imdb nthu_71 \
  --cfg experiments/cfgs/nthu_rpn.yml
