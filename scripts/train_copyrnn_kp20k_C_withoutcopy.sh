#!/bin/bash
ROOT_PATH=${PWD}
DATA_DIR=$ROOT_PATH/data
SRC_TRAIN=$DATA_DIR/raw/kp20k_new/kp20k_training_C.json
SRC_VALID=$DATA_DIR/raw/kp20k_new/kp20k_validation_C.json
SRC_TEST=$DATA_DIR/raw/kp20k_new/kp20k_testing_C.json
DEST_TRAIN=$DATA_DIR/kp20k.train_C_withoutcopy.json
DEST_VALID=$DATA_DIR/kp20k.valid_C_withoutcopy.json
DEST_TEST=$DATA_DIR/kp20k.test_C_withoutcopy.json
DEST_VOCAB=$DATA_DIR/vocab_kp20k_C.txt

TRAIN_FILENAME=$DEST_TRAIN
VALID_FILENAME=$DEST_VALID
TEST_FILENAME=$DEST_TEST
VOCAB_PATH=$DEST_VOCAB
DEST_DIR=$DATA_DIR/kp20k/
EXP_NAME=copyrnn_kp20k_basic_C_withoutcopy

# export CUDA_VISIBLE_DEVICES=1

python3 deep_keyphrase/copy_rnn/train.py -exp_name $EXP_NAME \
  -train_filename $TRAIN_FILENAME \
  -valid_filename $VALID_FILENAME -test_filename $TEST_FILENAME \
  -batch_size 128 -max_src_len 1500 -learning_rate 0.002 \
  -token_field title_and_abstract_tokens -keyphrase_field keyword_tokens \
  -vocab_path $VOCAB_PATH -dest_base_dir $DEST_DIR \
  -bidirectional -teacher_forcing -shuffle -prefetch \
  -schedule_lr -schedule_step 10000 -epochs 20 -save_model_step 8000 \
  -eval_batch_size 64 -early_stop_tolerance 6 -beam_size 32

