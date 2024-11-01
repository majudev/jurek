# Handwritten Text Recognition base

This directory contains code required to train HTR model
for recognizing handwritten text in Polish language.

## The dataset

For training PHCD dataset was used. Its name stands for
Baza Danych Polskich Odręcznie Pisanych Znaków
(Polish Handwritten Characters Database). It can be accessed
at [https://cs.pollub.pl/phcd/](https://cs.pollub.pl/phcd/).

Download and prepare the dataset using:
```
./download_dataset.sh
```
This tool requires you to have `unrar` and `wget` installed on your system.

This tool generated ground truth data for every single sample, therefore
it may take a while to finish.

## Train!

Run `./train_tesseract.sh` to train the model.
