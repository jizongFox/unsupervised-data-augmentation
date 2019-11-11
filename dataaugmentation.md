in this repo, the dataloaders are as following:
```
labeled_dataset: 4000
Transform: Compose(
               Compose(
               <data.Augmentation object at 0x7f365b7d0890> #fa_reduced_cifar10 
           )
               RandomCrop(size=(32, 32), padding=4)
               RandomHorizontalFlip(p=0.5)
               ToTensor()
               Normalize(mean=(0.4914, 0.4822, 0.4465), std=(0.2023, 0.1994, 0.201))
               <data.CutoutDefault object at 0x7f365b7d0590>
           )

unlabeled_dataset: 46000
transform_1: 
Compose(
    RandomCrop(size=(32, 32), padding=4)
    RandomHorizontalFlip(p=0.5)
    ToTensor()
    Normalize(mean=(0.4914, 0.4822, 0.4465), std=(0.2023, 0.1994, 0.201))
)
transform_2:
Compose(
    <data.Augmentation object at 0x7ff7d7cc4c50>
	RandomCrop(size=(32, 32), padding=4)
	RandomHorizontalFlip(p=0.5)
	ToTensor()
	Normalize(mean=(0.4914, 0.4822, 0.4465), std=(0.2023, 0.1994, 0.201))
	<data.CutoutDefault object at 0x7ff7d7c81790>
)
test_set: 10000
Transform: Compose(
               ToTensor()
               Normalize(mean=(0.4914, 0.4822, 0.4465), std=(0.2023, 0.1994, 0.201))
           )
testloader.dataset.__len__()

```