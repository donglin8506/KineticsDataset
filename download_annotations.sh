#!/usr/bin/env bash

# 使用方式 :
# 1. sh download_annotations.sh 400
# 2. sh download_annotations.sh 600
# 3. sh download_annotations.sh 700

DATASET=$1
if [ "$DATASET" == "400" ] || [ "$1" == "600" ] || [ "$1" == "700" ]; then
        echo "We are processing $DATASET"
else
        echo "Bad Argument, we only support 400, 600 or 700"
        exit 0
fi

train_url="https://s3.amazonaws.com/kinetics/${DATASET}/annotations/train.csv"
val_url="https://s3.amazonaws.com/kinetics/${DATASET}/annotations/val.csv"
test_url="https://s3.amazonaws.com/kinetics/${DATASET}/annotations/test.csv"

if [ $DATASET == 600 ]; then
    train_url=${train_url/.csv/.txt}
    val_url=${val_url/.csv/.txt}
fi

echo $train_url
echo $val_url
echo $test_url

# 输出文件夹
OUTPUT_DIR="kinetics${DATASET}" 

# 下载训练集视频标注
train_folder=$OUTPUT_DIR/train_annotations
if [ ! -d $train_folder ]; then
    mkdir $train_folder
fi
wget -c $train_url -P $train_folder

# 下载验证集视频标注
val_folder=$OUTPUT_DIR/val_annotations
if [ ! -d $val_folder ]; then
    mkdir $val_folder
fi
wget -c $val_url -P $val_folder

# 下载测试集视频标注
test_folder=$OUTPUT_DIR/test_annotations
if [ ! -d $test_folder ]; then
    mkdir $test_folder
fi
wget -c $test_url -P $test_folder

