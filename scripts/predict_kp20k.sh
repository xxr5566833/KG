#!/bin/bash
ROOT_PATH=${PWD}
DATA_DIR=$ROOT_PATH/data
TRAIN_FILENAME=$DATA_DIR/kp20k.train.jsonl
VALID_FILENAME=$DATA_DIR/kp20k.valid.jsonl
TEST_FILENAME=$DATA_DIR/kp20k.test.jsonl
VOCAB_PATH=$DATA_DIR/vocab_kp20k.txt
DEST_SUFFIX=.result.json
DEST_NAME=$TEST_FILENAME$DEST_SUFFIX
EXP_NAME=copyrnn_kp20k_basic

python3 deep_keyphrase/predict_runner.py -src_filename $TEST_FILENAME \
        -dest_filename $DEST_NAME \
        -vocab_path $VOCAB_PATH  
