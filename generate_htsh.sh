#!/bin/bash

fun () {
  while IFS= read -r line
  do
    lo=$(echo $line | grep "{{ .* }}" | sed -e 's/{{ \(.*\) }}/\1/g')
  
    if [ -z "$lo" ]
    then
  	  echo $line >> $out
    else
      cat $fpath$lo >> $out
    fi
    lo=""
  done < $1
  
}

input_full="htsh_split/main.htsh"
out="html/index.htsh"

if [ ! -d html ]
then
  mkdir html
fi

fpath=$(echo $input_full | sed -e "s#\(.*/\).*#\1#")
file=$(echo $input_full | sed -e "s#.*/\(.*\)#\1#")

if [ "$fpath" == "$file" ]
then
  fpath=""
fi
input=$fpath$file

if [ -f $out ]
then
  rm $out
fi

touch $out

fun $input

continue=$(grep "{{ .* }}" $out)
while [ ! -z "$continue" ]
do
  mv $out out2.html
  fun out2.html
  continue=$(grep "{{ .* }}" $out)
done

