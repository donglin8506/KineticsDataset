#!/usr/bin/env bash

# 使用方式 :
# 1. sh extract_videos.sh 400
# 2. sh extract_videos.sh 600
# 3. sh extract_videos.sh 700

DATASET=$1
if [ "$DATASET" == "400" ] || [ "$1" == "600" ] || [ "$1" == "700" ]; then
        echo "We are processing $DATASET"
else
        echo "Bad Argument, we only support 400, 600 or 700"
        exit 0
fi

INPUT_DIR="kinetics${DATASET}_tgz" 
OUTPUT_DIR="kinetics${DATASET}"

# 解压训练集
train_folder=$OUTPUT_DIR/train
if [ ! -d $train_folder ]; then
    mkdir -p $train_folder
fi
for f in $(ls $INPUT_DIR/train)
do 
    if [[ $f == *.tar.gz ]]; then
        echo "Extracting $INPUT_DIR/train/$f to $train_folder"
        tar -zxvf $INPUT_DIR/train/$f -C $train_folder
    fi
done 
echo "train extracted successed."

# 解压验证集
val_folder=$OUTPUT_DIR/val
if [ ! -d $val_folder ]; then
    mkdir -p $val_folder
fi
for f in $(ls $INPUT_DIR/val)
do 
    if [[ $f == *.tar.gz ]]; then
        echo "Extracting $INPUT_DIR/val/$f to $val_folder"
        tar -zxvf $INPUT_DIR/val/$f -C $val_folder
    fi
done 
echo "val extracted successed."

# 解压测试集
test_folder=$OUTPUT_DIR/test
if [ ! -d $test_folder ]; then
    mkdir -p $test_folder
fi
for f in $(ls $INPUT_DIR/test)
do 
    if [[ $f == *.tar.gz ]]; then
        echo "Extracting $INPUT_DIR/test/$f to $test_folder"
        tar -zxvf $INPUT_DIR/test/$f -C $test_folder
    fi
done 
echo "test extracted successed."