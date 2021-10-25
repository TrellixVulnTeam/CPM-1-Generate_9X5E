#!/bin/bash

CHECKPOINT_PATH=$1
MPSIZE=1
NLAYERS=32
NHIDDEN=2560
NATT=32
MAXSEQLEN=1024

CMD="python3 -m torch.distributed.launch --nproc_per_node $MPSIZE generate_samples.py \
       --model-parallel-size $MPSIZE \
       --num-layers $NLAYERS \
       --hidden-size $NHIDDEN \
       --load $CHECKPOINT_PATH \
       --num-attention-heads $NATT \
       --seq-length $MAXSEQLEN \
       --max-position-embeddings 1024 \
       --cache-dir cache \
       --seed 16
       --tokenizer-path bpe_3w_new/ \
       --vocab-size 30000 "

$CMD
