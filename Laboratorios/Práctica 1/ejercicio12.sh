#!/bin/bash


echo "Usuario   num.procesos"
echo "=======   ============"


for i in `who | cut -f1 -d" " | sort -u`
do
    $numProcesos=`ps -u rosa | tail -n +2 | wc -l`
    echo "$i   $numProcesos"
done

