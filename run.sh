#!/usr/bin/env bash

python train.py -c confs/wresnet28x2.yaml --unsupervised --save=UDA --tag=UDA --method=UDA
python train.py -c confs/wresnet28x2.yaml --save=baseline --tag=baseline --method=UDA
python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC --tag=IIC_0.1 --method=IIC --alpha=0.1
python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC --tag=IIC_1 --method=IIC --alpha=1
python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC --tag=IIC_2 --method=IIC --alpha=2
python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC --tag=IIC_5 --method=IIC --alpha=5
python train.py -c confs/wresnet28x2.yaml --unsupervised --save=IIC --tag=IIC_10 --method=IIC --alpha=10
