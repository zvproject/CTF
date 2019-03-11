#!/bin/bash
cookie="$(curl -c - -s  http://159.89.166.12:13500/ | grep -oP '(?<=flag\s).*')"
echo $cookie >> tmp.txt
first=$cookie
cmp='0'
while [[ "$first" != "$cmp" ]]
do
	cookie="$(curl -c - -s --cookie 'flag='$cookie  http://159.89.166.12:13500/ | grep -oP '(?<=flag\s).*')"
	echo $cookie
	echo $cookie >> tmp.txt
	cmp=$cookie
done



