#!/bin/bash

while [ -e archive.zip ]; do
	if [[ $(file --mime-type -b archive.zip) == "application/zip" ]]; then
		cp archive.zip backup/archive.zip
	else
		break
	fi
	python generate_dct.py
	pass="$(fcrackzip -u -b -D -p ./dictionary.txt ./archive.zip)"
	pass="$(sed '/^$/d' <<< $pass)"
	pass="$(sed 's/.*== //' <<< $pass)"
	echo "$pass"
	unzip -o -P "$pass" ./archive.zip
done;
