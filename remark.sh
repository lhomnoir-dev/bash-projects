#!/bin/bash


echo -n "Entrez la note: "
read mark

if [ "$mark" -gt 16 ]; then
    echo "Très bien"
elif [ "$mark" -gt 14 ]; then
    echo "Bien"
elif [ "$mark" -gt 12 ]; then
    echo "Assez bien" 
elif [ "$mark"  -gt 10 ]; then
    echo "moyen"
else
    echo "Inssufisant"
fi