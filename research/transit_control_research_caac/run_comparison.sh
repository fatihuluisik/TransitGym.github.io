#!/bin/bash
# Runs CAAC (no safety filter) and CAAC_Safe (action-clipping safety filter)
# with identical seed/episode settings, so results in log/comparison_metrics.csv
# are directly comparable.
#
# Usage: bash run_comparison.sh

SEED=4
EPISODES=251
H_MAX=900

echo "=== Running CAAC (baseline, no safety filter) ==="
python main.py --control=2 --model=caac --train=1 --episode=$EPISODES \
    --para_flag=A_0_1 --share_scale=1 --seed=$SEED --vis=0 --data=A_0_1 \
    --restore=0 --w=2 --all=1

echo "=== Running CAAC_Safe (action clipping, H_max=${H_MAX}s) ==="
python main.py --control=2 --model=caac_safe --train=1 --episode=$EPISODES \
    --para_flag=A_0_1 --share_scale=1 --seed=$SEED --vis=0 --data=A_0_1 \
    --restore=0 --w=2 --all=1 --H_max=$H_MAX

echo "Done. Results appended to log/comparison_metrics.csv"
