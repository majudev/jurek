#!/bin/bash
if [ ! -d znaki ]; then
	if [ ! -e phcd.rar ]; then
		wget https://cs.pollub.pl/phcd/phcd.rar
	fi
	unrar x phcd.rar phsf.rar
	unrar x phsf.rar znaki
#	unrar x phsf.rar inwokacja
	rm phsf.rar
fi
if [ ! -d training_data ]; then
	mkdir training_data
#	for i in {0..9}; do
#		PREFIX="znaki/png/$i"
#		for file in $PREFIX/*; do
#			echo "\"$PREFIX\"/\"`basename \"$file\"`\""
#			ln -s "../$file" "training_data/$i-`basename \"$file\"`"
#			echo $i > "training_data/$i-`basename \"$file\" .png`.gt.txt"
#		done
#	done
	MAPPER="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZąćęłńóśźżĄĆĘŁŃÓŚŹŻ"
	for i in {0..88}; do
		PREFIX="znaki/png/$i"
		if [ $i -eq 80 ]; then
			CHAR="plus"
			CHAR_GT="+"
		elif [ $i -eq 81 ]; then
			CHAR="minus"
			CHAR_GT="-"
		elif [ $i -eq 82 ]; then
			CHAR="dwukropek"
			CHAR_GT=":"
		elif [ $i -eq 83 ]; then
			CHAR="srednik"
			CHAR_GT=";"
		elif [ $i -eq 84 ]; then
			CHAR="dolar"
			CHAR_GT="\$"
		elif [ $i -eq 85 ]; then
			CHAR="wykrzyknik"
			CHAR_GT="!"
		elif [ $i -eq 86 ]; then
			CHAR="pytajnik"
			CHAR_GT="?"
		elif [ $i -eq 87 ]; then
			CHAR="malpa"
			CHAR_GT="@"
		elif [ $i -eq 88 ]; then
			CHAR="kropka"
			CHAR_GT="."
		else
			CHAR=${MAPPER:$i:1}
			CHAR_GT="$CHAR"
		fi
		echo "Processing character '$CHAR'..."

		for file in $PREFIX/*; do
#			TARGET=$(echo "training_data/$CHAR-`basename \"$file\"`" | tr ' ' '_')
#			TARGET_GT=$(echo "training_data/$CHAR-`basename \"$file\" .png`.gt.txt" | tr ' ' '_')
#			echo $TARGET
			mv -T "$file" $(echo "training_data/$CHAR-`basename \"$file\"`" | tr ' ' '_')
			echo $CHAR_GT > $(echo "training_data/$CHAR-`basename \"$file\" .png`.gt.txt" | tr ' ' '_')
		done
	done
fi
