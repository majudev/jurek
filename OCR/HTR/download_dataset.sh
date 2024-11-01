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
	for i in {0..61}; do
		PREFIX="znaki/png/$i"
		CHAR=${MAPPER:$i:1}

		for file in $PREFIX/*; do
#			TARGET=$(echo "training_data/$CHAR-`basename \"$file\"`" | tr ' ' '_')
#			TARGET_GT=$(echo "training_data/$CHAR-`basename \"$file\" .png`.gt.txt" | tr ' ' '_')
#			echo $TARGET
			mv -T "$file" $(echo "training_data/$CHAR-`basename \"$file\"`" | tr ' ' '_')
			echo $CHAR > $(echo "training_data/$CHAR-`basename \"$file\" .png`.gt.txt" | tr ' ' '_')
		done
	done
fi
