#!/usr/bin/env bash
# 训练分类模型
export BERT_BASE_DIR=/home/admin/EA-CKGQA/NER/chinese_L-12_H-768_A-12
export DATA_DIR=/home/admin/PQA/EL/data/train_classif
export TRAINED_CLASSIFIER=./output
export MODEL_NAME=mobile

python run_classifier_serving.py \
  --task_name=poetry \
  --do_train=true \
  --do_eval=true \
  --do_predict=False \
  --data_dir=$DATA_DIR \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=32 \
  --learning_rate=2e-5 \
  --num_train_epochs=1.0 \
  --output_dir=$TRAINED_CLASSIFIER/$MODEL_NAME