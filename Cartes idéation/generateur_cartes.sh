#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: cert_batch.sh [cartes.csv]"
    exit 1
fi

file=$1

while read line; do
    name=$(echo $line | cut -d ';' -f1)
    description=$(echo $line | cut -d ';' -f3)
    family=$(echo $line | cut -d ';' -f4)
    color=$(echo $line | cut -d ';' -f5)
    sed "s/NOM/$name/g;s/DESCRIPTION/$description/g;s/FAMILLE/$family/g;s/#3465a4/$color/g" carte_vierge.svg > "cartes/$name.svg"
done < $file


