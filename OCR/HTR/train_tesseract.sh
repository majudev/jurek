#!/bin/bash
if [ ! -d ../tesstrain ]; then
	git submodule update --init --recursive
fi
if [ ! -d ../tessdata ] || [ ! -e ../tessdata/pol.traineddata ]; then
	if [ ! -d ../tessdata ]; then
		mkdir ../tessdata
	fi
	cd ../tessdata
	wget https://github.com/tesseract-ocr/tessdata_best/raw/refs/heads/main/pol.traineddata
	cd ../KRK
fi
cd ../tesstrain
export MAKE_ARGS="MODEL_NAME=jurekbase START_MODEL=pol TESSDATA=../tessdata GROUND_TRUTH_DIR=../HTR/training_data"
make training $MAKE_ARGS
make plot $MAKE_ARGS
cd ../KRK
cp ../tesstrain/data/jurekbase.traineddata .
