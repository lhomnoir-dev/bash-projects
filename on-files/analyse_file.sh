#!/bin/bash

analyse_file(){
    local file_name=$1

    if [ -f "$file_name" ]; then
        local lines=$(wc -l < "$file_name")
        local words=$(wc -w < "$file_name")
        local chars=$(wc -c < "$file_name")

        echo "lines: $lines"
        echo "words: $words"
        echo "characteres: $chars"
    fi
}

advance_search(){
    local word=$1
    local file_name=$2

    # Verify file existence
    if [ ! -f "$file_name" ]; then
        echo "Error: file does not found!"
    fi

    # Search the word in the file
    if (grep -qi "$word" "$file_name"); then
        echo "Word found!"

        grep -ni "$word" "$file_name"
        local noccurence=$(grep -oi "$word" "$file_name" | wc -l)
        echo "nombre d'occurence: $noccurence"

    else
        echo "Word does not found!"
    fi
}

advance_search "linux" "fich1.txt"
