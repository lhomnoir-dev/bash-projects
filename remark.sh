#!/bin/bash

sum_notes=0
i=0

while true; do
    echo -n "Entrez la note: "
    read mark
    if [ "$mark" = "q" ] || [ "$mark" -lt 0 ]; then
        break
    fi
    if [ "$mark" -gt 16 ]; then
        echo "Très bien"
    elif [ "$mark" -gt 14 ]; then
        echo "Bien"
    elif [ "$mark" -gt 12 ]; then
        echo "Assez bien"
    elif [ "$mark" -gt 10 ]; then
        echo "Moyen"
    else
        echo "Insuffisant"
    fi
    ((sum_notes += mark))
    ((i++))
done

if [ "$i" -eq 0 ]; then
    echo "moyenne: "
else
    echo "moyenne: $((sum_notes / i))"
fi