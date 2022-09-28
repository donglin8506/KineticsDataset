#!/usr/bin/env bash

# 使用方式 :
# 1. sh download_videos.sh 400
# 2. sh download_videos.sh 600
# 3. sh download_videos.sh 700

DATASET=$1
if [ "$DATASET" == "400" ] || [ "$1" == "600" ] || [ "$1" == "700" ]; then
        echo "We are processing $DATASET"
else
        echo "Bad Argument, we only support 400, 600 or 700"
        exit 0
fi

train_url="https://s3.amazonaws.com/kinetics/${DATASET}/train/k${DATASET}_train_path.txt"
val_url="https://s3.amazonaws.com/kinetics/${DATASET}/train/k${DATASET}_val_path.txt"
test_url="https://s3.amazonaws.com/kinetics/${DATASET}/train/k${DATASET}_test_path.txt"

# 输出文件夹
OUTPUT_DIR="kinetics${DATASET}_tgz" 

# 下载训练集视频
train_folder=$OUTPUT_DIR/train
if [ ! -d $train_folder ]; then
    mkdir $train_folder
fi
wget -c -i $train_url -P $train_folder

# 下载验证集视频
val_folder=$OUTPUT_DIR/val
if [ ! -d $val_folder ]; then
    mkdir $val_folder
fi
wget -c -i $val_url -P $val_folder

# 下载测试集视频
test_folder=$OUTPUT_DIR/test
if [ ! -d $test_folder ]; then
    mkdir $test_folder
fi
wget -c -i $test_url -P $test_folder




