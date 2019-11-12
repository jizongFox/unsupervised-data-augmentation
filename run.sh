#!/usr/bin/env bash

set -e

CC_WRAPPER_PATH=$(python -c "import deepclustering; print(deepclustering.CC_wrapper_path)")
LC_WRAPPER_PATH=$(python -c "import deepclustering; print(deepclustering.LC_wrapper_path)")
source $CC_WRAPPER_PATH # enable wrapper
source $LC_WRAPPER_PATH # enable local_wrapper


max_epoch=1600
time=12
dataset=cifar10
account=rrg-mpederso

declare -a StringArray=(
"python train.py -c confs/wresnet28x2.yaml --unsupervised --save=UDA --tag=UDA --method=UDA"
"python train.py -c confs/wresnet28x2.yaml --save=baseline --tag=baseline --method=UDA"
"python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC_0.1 --tag=IIC_0.1 --method=IIC --alpha=0.1"
"python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC_1 --tag=IIC_1 --method=IIC --alpha=1"
"python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC_2 --tag=IIC_2 --method=IIC --alpha=2"
"python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC_5 --tag=IIC_5 --method=IIC --alpha=5"
"python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC_10 --tag=IIC_10 --method=IIC --alpha=10"

)
gpuqueue "${StringArray[@]}" --available_gpus 0 1
for cmd in "${StringArray[@]}"
do
echo ${cmd}
CC_wrapper "${time}" "${account}" "${cmd}" 16
#local_wrapper "${cmd}"
done